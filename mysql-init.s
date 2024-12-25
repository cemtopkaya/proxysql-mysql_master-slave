/* 
 * ProxySQL içinde proxysql_monitor kullanıcısı, proxysql.cnf dosyasında tanımlı 
 * kullanıcı adı (monitor_username) ve şifresiyle (monitor_password) eşleşmelidir.
 * 
 * Bu kullanıcı Mysql sunucularında (master ve slave) monitor kullanıcısı olarak
 * kullanılacaktır. Bu kullanıcılar, ProxySQL tarafından MySQL sunucularını izlemek için kullanılır.
 **/
CREATE USER IF NOT EXISTS 'proxysql_monitor'@'%' IDENTIFIED BY 'monitor_pass123';

-- REPLICATION CLIENT yetkisi, MySQL içinde replikasyonla ilgili durum bilgilerini 
-- (örneğin `SHOW MASTER STATUS`, `SHOW SLAVE STATUS`) görüntüleme ve izleme imkânı sağlar.
GRANT REPLICATION CLIENT ON *.* TO 'proxysql_monitor'@'%';
GRANT SELECT ON mysql.* TO 'proxysql_monitor'@'%';

-- Uygulama kullanıcısı oluşturma
CREATE USER IF NOT EXISTS'app_user'@'%' IDENTIFIED BY 'app_pass123';
GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%'; WITH GRANT OPTION;
GRANT SUPER ON *.* TO 'app_user'@'%';                             -- Tüm veritabanlarına erişim izni için

FLUSH PRIVILEGES;

-- Master konfigürasyonu
CREATE USER IF NOT EXISTS 'rep_user'@'%' IDENTIFIED BY 'YourStrongPassword';
-- Bu yetki, kullanıcının ana sunucudaki binlogları okumasına ve başka bir sunucuda “slave” olarak replikasyon yapmasına imkan tanır. 
-- Böylece “rep_user” kullanıcısı veritabanı değişikliklerini izleyip kopyalayabilir.
GRANT REPLICATION SLAVE ON *.* TO 'rep_user'@'%';
FLUSH PRIVILEGES;

STOP SLAVE;
CHANGE MASTER TO
  MASTER_HOST='master_server_ip',
  MASTER_USER='app_user',
  MASTER_PASSWORD='app_pass123',
  MASTER_LOG_FILE='mysql-bin.000001',
  MASTER_LOG_POS=107;
START SLAVE;