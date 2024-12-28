#!/bin/bash
set -ex

echo "Waiting for MySQL servers to be ready..."
sleep 30

# Initialize all nodes first
for node in master1 master2 master3; do
    echo "Initializing $node..."
    mysql -h $node -uroot -proot_password -e "
    STOP GROUP_REPLICATION;
    RESET MASTER;
    SET GLOBAL super_read_only=0;
    SET GLOBAL read_only=0;
    SET SQL_LOG_BIN=0;
    RESET SLAVE ALL;
    
    CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
    GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
    GRANT SUPER ON *.* TO 'repl_user'@'%';
    GRANT SELECT ON performance_schema.* TO 'repl_user'@'%';
    FLUSH PRIVILEGES;
    
    SET SQL_LOG_BIN=1;
    
    CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123' 
    FOR CHANNEL 'group_replication_recovery';
    "
done

# Verify plugin exists before continuing
echo "Verifying group replication plugin..."
mysql -h master1 -uroot -proot_password -e "SELECT PLUGIN_NAME, PLUGIN_STATUS FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME = 'group_replication';"

# Bootstrap master1
echo "Bootstrapping master1..."
mysql -h master1 -uroot -proot_password -e "
SET GLOBAL group_replication_bootstrap_group=ON;
START GROUP_REPLICATION;
SET GLOBAL group_replication_bootstrap_group=OFF;"

sleep 15

# Start remaining nodes
for node in master2 master3; do
    echo "Starting replication on $node..."
    mysql -h $node -uroot -proot_password -e "START GROUP_REPLICATION;"
    sleep 15
done

# Final check
echo "Final cluster status:"
mysql -h master1 -uroot -proot_password -e "
SELECT * FROM performance_schema.replication_group_members;"