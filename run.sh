#!/bin/bash
set -e  # Hata durumunda scripti durdur

# Dizin kontrolü
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld

# Her komut için hata kontrolü
check_mysql_command_result() {
    if [ $? -ne 0 ]; then
        echo "MySQL command failed"
        exit 1
    fi
}

# Group Replication kontrolü
check_replication() {
    MYSQL_PWD=root_password mysql -h master1 -u root -e "
        SELECT COUNT(*) as members 
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
MYSQL_PWD=root_password mysql -h master1 -u root -e "SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME='group_replication';"
check_mysql_command_result
MYSQL_PWD=root_password mysql -h master2 -u root -e "SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME='group_replication';"
check_mysql_command_result
MYSQL_PWD=root_password mysql -h master3 -u root -e "SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME='group_replication';"
check_mysql_command_result

echo "Bootstrapping first member (mysql-member-1)..."
MYSQL_PWD=root_password mysql -h master1 -u root -e "
SET GLOBAL group_replication_bootstrap_group=ON;
START GROUP_REPLICATION;
SET GLOBAL group_replication_bootstrap_group=OFF;"
check_mysql_command_result

sleep 10

for i in {2..3}; do
    echo "Starting replication on mysql-member-$i..."
    MYSQL_PWD=root_password mysql -h master$i -u root -e "START GROUP_REPLICATION;"
    check_mysql_command_result
    sleep 5
done

echo "Checking group replication status..."
MYSQL_PWD=root_password mysql -h master1 -u root -e "
SELECT * FROM performance_schema.replication_group_members;"

check_mysql_command_result
check_replication

echo "Setup completed!"