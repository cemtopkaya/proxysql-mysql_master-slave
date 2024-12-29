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
        SELECT * as members 
        FROM performance_schema.replication_group_members
        WHERE MEMBER_STATE = 'ONLINE';" | grep -q "3"
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
