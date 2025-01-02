#!/bin/bash
set -x  # Komutları göster
set -e  # Hata durumunda scripti durdur

cat << EOF > /tmp/master1.cnf
[client]
host=master1
user=root
password=$MYSQL_ROOT_PASSWORD
EOF

cat << EOF > /tmp/master2.cnf
[client]
host=master2
user=root
password=$MYSQL_ROOT_PASSWORD
EOF

cat << EOF > /tmp/master3.cnf
[client]
host=master3
user=root
password=$MYSQL_ROOT_PASSWORD
EOF

cat << EOF > /tmp/slave.cnf
[client]
host=slave
user=root
password=$MYSQL_ROOT_PASSWORD
EOF


# Her komut için hata kontrolü
check_mysql_command_result() {
    if [ $? -ne 0 ]; then
        echo "MySQL command failed"
        exit 1
    fi
}

# Group Replication kontrolü
check_replication() {
    echo "Checking group replication status..."
    mysql --defaults-file=/tmp/master1.cnf -e "
        SELECT *
        FROM performance_schema.replication_group_members
        WHERE MEMBER_STATE='ONLINE';"
    if [ $? -ne 0 ]; then
        echo "Group Replication failed"
        exit 1
    fi
}

# echo "Installing group_replication plugin on member-1..."
# CHANGE MASTER TO MASTER_USER='repl', MASTER_PASSWORD='repl' FOR CHANNEL 'group_replication_recovery';
# "INSTALL PLUGIN group_replication SONAME 'group_replication.so';"
# mysql -hmaster1 -uroot -proot_password -e "INSTALL PLUGIN group_replication SONAME 'group_replication.so';"

# check group_replication plugin installed on master1
mysql --defaults-file=/tmp/master1.cnf -e "SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME='group_replication';"
check_mysql_command_result
mysql --defaults-file=/tmp/master2.cnf -e "SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME='group_replication';"
check_mysql_command_result
mysql --defaults-file=/tmp/master3.cnf -e "SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME='group_replication';"
check_mysql_command_result

# --------- First master setup ---------

initialize_master() {
    local cnf_file=$1
    echo "Bootstrapping first member (mysql-member-1)..."
    mysql --defaults-file=$cnf_file -e "
        STOP GROUP_REPLICATION;
        RESET MASTER;
        SET GLOBAL super_read_only=0;
        SET GLOBAL read_only=0;
        SET SQL_LOG_BIN=0;

        CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
        GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
        GRANT REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
        GRANT SELECT ON performance_schema.* TO 'repl_user'@'%';
        GRANT SUPER ON *.* TO 'repl_user'@'%';

        # ProxySQL monitor user'ı ekle
        CREATE USER IF NOT EXISTS 'monitor'@'%' IDENTIFIED BY 'monitor';
        GRANT REPLICATION CLIENT ON *.* TO 'monitor'@'%';
        GRANT SELECT ON *.* TO 'monitor'@'%';
        GRANT SUPER ON *.* TO 'monitor'@'%';

        # Uygulama kullanıcısı (proxysql önünde çalışacak uygulamanın veritabanına erişmek için kullanacağı kullanıcı)
        CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
        GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%' WITH GRANT OPTION; 
        GRANT SUPER ON *.* TO 'app_user'@'%';


        FLUSH PRIVILEGES;

        CHANGE MASTER TO 
          MASTER_USER='repl_user', 
          MASTER_PASSWORD='repl_pass123' 
          FOR CHANNEL 'group_replication_recovery';

        SET GLOBAL group_replication_bootstrap_group=ON;
        START GROUP_REPLICATION;
        SET GLOBAL group_replication_bootstrap_group=OFF;
        SET SQL_LOG_BIN=1;"
    check_mysql_command_result
    sleep 30

    check_replication

    echo "Master initialized!"
}

initialize_master /tmp/master1.cnf
sleep 30

check_replication
echo "Master initialized!"


# --------- OTHER masters setup ---------

initialize_other_master() {
    local cnf_file=$1
    echo "Initializing other master..."
    mysql --defaults-file=$cnf_file -e "
        STOP GROUP_REPLICATION;
        RESET MASTER;
        SET GLOBAL super_read_only=0;
        SET GLOBAL read_only=0;
        SET SQL_LOG_BIN=0;

        CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
        GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
        GRANT REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
        GRANT SELECT ON performance_schema.* TO 'repl_user'@'%';
        GRANT SUPER ON *.* TO 'repl_user'@'%';

        # ProxySQL monitor user'ı ekle
        CREATE USER IF NOT EXISTS 'monitor'@'%' IDENTIFIED BY 'monitor';
        GRANT REPLICATION CLIENT ON *.* TO 'monitor'@'%';
        GRANT SELECT ON *.* TO 'monitor'@'%';
        GRANT SUPER ON *.* TO 'monitor'@'%';

        # Uygulama kullanıcısı (proxysql önünde çalışacak uygulamanın veritabanına erişmek için kullanacağı kullanıcı)
        CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
        GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%' WITH GRANT OPTION; 
        GRANT SUPER ON *.* TO 'app_user'@'%';

        FLUSH PRIVILEGES;

        CHANGE MASTER TO 
            MASTER_USER='repl_user', 
            MASTER_PASSWORD='repl_pass123' 
            FOR CHANNEL 'group_replication_recovery';

        START GROUP_REPLICATION;
        SET SQL_LOG_BIN=1;"
    check_mysql_command_result
}

for i in 2 3; do
    initialize_other_master /tmp/master$i.cnf
    sleep 30
    echo "Master$i setup completed!"
done

check_replication

# --------- Slave setup ---------
initialize_slave() {
    local cnf_file=$1
    echo "Initializing slave..."
    
    # Önce kullanıcıları oluştur (read_only kapalıyken)
    mysql --defaults-file=$cnf_file -e "
        STOP SLAVE;
        RESET SLAVE;
        SET GLOBAL super_read_only=0;
        SET GLOBAL read_only=0;
        SET SQL_LOG_BIN=0;

        CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
        GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
        # Uygulama kullanıcısı (proxysql önünde çalışacak uygulamanın veritabanına erişmek için kullanacağı kullanıcı)
        CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
        GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%' WITH GRANT OPTION; 
        GRANT SUPER ON *.* TO 'app_user'@'%';

        FLUSH PRIVILEGES;"
    check_mysql_command_result

    # Sonra replikasyonu başlat ve read_only moduna geç
    mysql --defaults-file=$cnf_file -e "
        CHANGE MASTER TO 
            MASTER_HOST='master1',
            MASTER_USER='repl_user', 
            MASTER_PASSWORD='repl_pass123',
            MASTER_AUTO_POSITION=1;

        START SLAVE;
        SET SQL_LOG_BIN=1;
        
        # En son read-only moduna geç
        SET GLOBAL read_only=1;
        SET GLOBAL super_read_only=1;"
    check_mysql_command_result
}

# Ana replikasyon kurulumu tamamlandıktan sonra slave'i başlat
check_replication
initialize_slave /tmp/slave.cnf
sleep 30

# Slave durumunu kontrol et
mysql --defaults-file=/tmp/slave.cnf -e "SHOW SLAVE STATUS\G"
check_mysql_command_result

echo "Slave setup completed!"

# Master1'e bağlanıp kullanıcıları oluşturalım
mysql -h master1 -uroot -proot_password << EOF
CREATE USER IF NOT EXISTS 'monitor'@'%' IDENTIFIED BY 'monitor';
GRANT SUPER, REPLICATION CLIENT ON *.* TO 'monitor'@'%';

# Uygulama kullanıcısı (proxysql önünde çalışacak uygulamanın veritabanına erişmek için kullanacağı kullanıcı)
CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%' WITH GRANT OPTION; 
GRANT SUPER ON *.* TO 'app_user'@'%';


FLUSH PRIVILEGES;
EOF
sleep 30
echo "Monitor and app_user users created!"