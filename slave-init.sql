-- Monitor kullanıcısı
CREATE USER IF NOT EXISTS 'proxysql_monitor'@'%' IDENTIFIED BY 'monitor_pass123';

GRANT REPLICATION CLIENT ON *.* TO 'proxysql_monitor'@'%';
GRANT SELECT ON mysql.* TO 'proxysql_monitor'@'%';

-- Uygulama kullanıcısı oluşturma
CREATE USER IF NOT EXISTS'app_user'@'%' IDENTIFIED BY 'app_pass123';
GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%'; WITH GRANT OPTION;
GRANT SUPER ON *.* TO 'app_user'@'%'; 
FLUSH PRIVILEGES;

-- SLAVE konfigürasyonu
CREATE USER IF NOT EXISTS 'rep_user'@'%' IDENTIFIED BY 'YourStrongPassword';
GRANT REPLICATION SLAVE ON *.* TO 'rep_user'@'%';
FLUSH PRIVILEGES;

-- SLAVE için replikasyon işlemlerini başlatma
STOP SLAVE;
RESET SLAVE;

CHANGE MASTER TO
  MASTER_HOST='mysql-master',
  MASTER_USER='rep_user',
  MASTER_PORT=3306,
  MASTER_PASSWORD='YourStrongPassword',
  -- MASTER_LOG_FILE='mysql-bin.000001',
  -- Replikasyon işlemlerinde MASTER_LOG_POS değeri, replikasyonun hangi noktadan başlayacağını belirler. Bu değeri doğru ayarlamak, replikasyonun doğru bir şekilde çalışması için kritik öneme sahiptir.
  -- MASTER_LOG_POS=0
  ;

START SLAVE;

SHOW SLAVE STATUS;