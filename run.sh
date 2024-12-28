#!/bin/bash
set -ex

echo "Waiting for MySQL servers to be ready..."
sleep 30

# Initialize master1 first
echo "Setting up master1..."
mysql -h master1 -uroot -proot_password -e "
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

CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123' 
FOR CHANNEL 'group_replication_recovery';

SET GLOBAL group_replication_bootstrap_group=ON;
START GROUP_REPLICATION;
SET GLOBAL group_replication_bootstrap_group=OFF;
SET SQL_LOG_BIN=1;"

sleep 30

# Configure remaining nodes
for node in master2 master3; do
    echo "Setting up $node..."
    mysql -h $node -uroot -proot_password -e "
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
    
    CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123'
    FOR CHANNEL 'group_replication_recovery';
    
    START GROUP_REPLICATION;
    SET SQL_LOG_BIN=1;"
    
    sleep 30
done

# Final check
echo "Final cluster status:"
mysql -h master1 -uroot -proot_password -e "
SELECT * FROM performance_schema.replication_group_members;"