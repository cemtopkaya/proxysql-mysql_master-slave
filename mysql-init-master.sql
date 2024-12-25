/**
 * ProxySQL içinde proxysql_monitor kullanıcısı, proxysql.cnf dosyasında tanımlı 
 * kullanıcı adı (monitor_username) ve şifresiyle (monitor_password) eşleşmelidir.
 * 
 * Bu kullanıcı Mysql sunucularında (master ve slave) monitor kullanıcısı olarak
 * kullanılacaktır. Bu kullanıcılar, ProxySQL tarafından MySQL sunucularını izlemek için kullanılır.
 **/
CREATE USER IF NOT EXISTS 'proxysql_monitor'@'%' IDENTIFIED BY 'monitor_pass123';

/**
 * REPLICATION CLIENT yetkisi, MySQL sunucusundaki binlog (binary log) bilgilerine erişim sağlamak için kullanılır. 
 * Bu yetki, kullanıcıya replikasyon durumunu ve binlog dosyalarını sorgulama izni verir. 
 * Bu, replikasyon yapılandırmalarında ve izlemelerinde önemlidir.
 * Örneğin, SHOW MASTER STATUS ve SHOW SLAVE STATUS gibi komutları çalıştırmak için bu yetki gereklidir.
 * 
 * ProxySQL'in her iki sunucuyu da izleyebilmesi için hem master hem de slave sunucularda REPLICATION CLIENT yetkisine sahip bir kullanıcı oluşturmanız gerekmektedir.
 **/
GRANT REPLICATION CLIENT ON *.* TO 'proxysql_monitor'@'%';

/**
 * proxysql_monitor kullanıcısının mysql veritabanına yetkilendirilmesinin nedeni, 
 * ProxySQL'in MySQL sunucularını izleyebilmesi için gerekli bilgilere erişim sağlamaktır. 
 * mysql veritabanı, MySQL sunucusunun yapılandırma ve durum bilgilerini içerir. 
 * Bu bilgiler, ProxySQL'in sunucuların durumunu izleyebilmesi ve gerektiğinde uygun aksiyonları alabilmesi için gereklidir.
 **/
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