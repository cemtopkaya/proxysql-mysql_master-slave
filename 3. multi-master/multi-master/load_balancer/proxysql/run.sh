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

check_mysql_command_result() {
    if [ $? -ne 0 ]; then
        echo "MySQL command failed"
        exit 1
    fi
}

# 1) Her node'da repl_user ve app_user oluştur.
echo "=== Creating repl_user and app_user on master1 ==="
mysql --defaults-file=/tmp/master1.cnf -e "
    CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
    GRANT REPLICATION SLAVE, REPLICATION CLIENT, SUPER ON *.* TO 'repl_user'@'%';

    CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
    GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%' WITH GRANT OPTION;

    CREATE USER IF NOT EXISTS 'monitor'@'%' IDENTIFIED BY 'monitor';
    GRANT SELECT ON *.* TO 'monitor'@'%';
    FLUSH PRIVILEGES;
"
check_mysql_command_result

echo "=== Creating repl_user and app_user on master2 ==="
mysql --defaults-file=/tmp/master2.cnf -e "
    CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
    GRANT REPLICATION SLAVE, REPLICATION CLIENT, SUPER ON *.* TO 'repl_user'@'%';

    CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
    GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%' WITH GRANT OPTION;

    CREATE USER IF NOT EXISTS 'monitor'@'%' IDENTIFIED BY 'monitor';
    GRANT SELECT ON *.* TO 'monitor'@'%';
    FLUSH PRIVILEGES;
"
check_mysql_command_result

echo "=== Creating repl_user and app_user on master3 ==="
mysql --defaults-file=/tmp/master3.cnf -e "
    CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
    GRANT REPLICATION SLAVE, REPLICATION CLIENT, SUPER ON *.* TO 'repl_user'@'%';

    CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
    GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%' WITH GRANT OPTION;

    CREATE USER IF NOT EXISTS 'monitor'@'%' IDENTIFIED BY 'monitor';
    GRANT SELECT ON *.* TO 'monitor'@'%';
    FLUSH PRIVILEGES;
"
check_mysql_command_result

# 2) Multi-master replikasyonu ring şeklinde kur: (master2 -> master1), (master3 -> master2), (master1 -> master3)
echo "=== master2 -> replicate from master1 ==="
mysql --defaults-file=/tmp/master2.cnf -e "
    STOP SLAVE;
    RESET SLAVE ALL;
    CHANGE MASTER TO
        MASTER_HOST='master1',
        MASTER_USER='repl_user',
        MASTER_PASSWORD='repl_pass123',
        MASTER_AUTO_POSITION=1;
    START SLAVE;
"
check_mysql_command_result

echo "=== master3 -> replicate from master2 ==="
mysql --defaults-file=/tmp/master3.cnf -e "
    STOP SLAVE;
    RESET SLAVE ALL;
    CHANGE MASTER TO
        MASTER_HOST='master2',
        MASTER_USER='repl_user',
        MASTER_PASSWORD='repl_pass123',
        MASTER_AUTO_POSITION=1;
    START SLAVE;
"
check_mysql_command_result

echo "=== master1 -> replicate from master3 ==="
mysql --defaults-file=/tmp/master1.cnf -e "
    STOP SLAVE;
    RESET SLAVE ALL;
    CHANGE MASTER TO
        MASTER_HOST='master3',
        MASTER_USER='repl_user',
        MASTER_PASSWORD='repl_pass123',
        MASTER_AUTO_POSITION=1;
    START SLAVE;
"
check_mysql_command_result

echo "All replication setup done with GTID-based multi-master ring!"
