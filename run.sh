#!/bin/bash

echo "Waiting for MySQL services to be ready..."
sleep 60

echo "Installing group_replication plugin on member-1..."
CHANGE MASTER TO MASTER_USER='repl', MASTER_PASSWORD='repl' FOR CHANNEL 'group_replication_recovery';
"INSTALL PLUGIN group_replication SONAME 'group_replication.so';"
mysql -hmysql1 -uroot -proot_password -e "INSTALL PLUGIN group_replication SONAME 'group_replication.so';"

echo "Bootstrapping first member (mysql-member-1)..."
mysql -hmysql1 -uroot -proot_password -e "
SET GLOBAL group_replication_bootstrap_group=ON;
START GROUP_REPLICATION;
SET GLOBAL group_replication_bootstrap_group=OFF;"

sleep 10

for i in {2..3}; do
    echo "Installing group_replication plugin on member-$i..."
    mysql -hmysql$i -uroot -proot_password -e "INSTALL PLUGIN group_replication SONAME 'group_replication.so';"
    
    echo "Starting replication on mysql-member-$i..."
    mysql -hmysql$i -uroot -proot_password -e "START GROUP_REPLICATION;"
    sleep 5
done

echo "Checking group replication status..."
mysql -hmysql-1 -uroot -proot_password -e "SELECT * FROM performance_schema.replication_group_members;"

echo "Setup completed!"