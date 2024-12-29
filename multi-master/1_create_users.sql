SET SQL_LOG_BIN=0;

-- Group Replication için gerekli kullanıcı
CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
GRANT SUPER, RELOAD ON *.* TO 'repl_user'@'%';

-- ProxySQL monitor kullanıcısı
CREATE USER IF NOT EXISTS 'proxysql_monitor'@'%' IDENTIFIED BY 'monitor_pass123';
GRANT SELECT ON *.* TO 'proxysql_monitor'@'%';
GRANT REPLICATION CLIENT ON *.* TO 'proxysql_monitor'@'%';

-- Uygulama kullanıcısı
CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%';

FLUSH PRIVILEGES;

-- Group Replication eklentisini yükle
-- INSTALL PLUGIN group_replication SONAME 'group_replication.so';

-- Group Replication için replikasyon kullanıcısını ayarla
CHANGE MASTER TO 
  MASTER_USER='repl_user', 
  MASTER_PASSWORD='repl_pass123' 
  FOR CHANNEL 'group_replication_recovery';

SET SQL_LOG_BIN=1;