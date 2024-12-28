SET SQL_LOG_BIN=0;

CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
CREATE USER IF NOT EXISTS 'proxysql_monitor'@'%' IDENTIFIED BY 'monitor_pass123';
CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';

# Update permissions for 5.7
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
GRANT SUPER ON *.* TO 'repl_user'@'%';
GRANT SELECT ON performance_schema.* TO 'repl_user'@'%';
GRANT SELECT ON mysql.* TO 'proxysql_monitor'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%';

# Configure replication recovery
CHANGE MASTER TO 
MASTER_USER='repl_user', 
MASTER_PASSWORD='repl_pass123' 
FOR CHANNEL 'group_replication_recovery';

FLUSH PRIVILEGES;
SET SQL_LOG_BIN=1;