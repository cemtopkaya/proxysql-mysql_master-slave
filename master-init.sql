/**
 * 3 Kullanıcıya ihtiyacım var:
 * 1. app_user: Uygulama kullanıcısı, proxysql önünde çalışacak uygulamanın veritabanına erişmek için kullanacağı kullanıcı.
 * 2. proxysql_monitor: ProxySQL tarafından MySQL sunucularını izlemek için kullanılır. Sadece REPLICATION CLIENT yetkisine sahip olmalıdır.
 * 3. rep_user: Replikasyon kullanıcısı, replikasyon işlemleri için kullanılır. REPLICATION SLAVE yetkisine sahip olmalıdır.
 *    Her ne kadar app_user ile replikasyon işlemleri yapılabilse de,
 *    app_user belirli bir veritanı üzerinde yetkilendirilmiş olabilir. 
 *    Bu nedenle replikasyon işlemleri için güvenlik nedeniyle ayrı bir kullanıcı oluşturulması önerilir.
 *
 * Örneğin, bir kullanıcıya hem REPLICATION CLIENT hem de REPLICATION SLAVE yetkilerini vermek için aşağıdaki SQL komutunu kullanabilirsiniz:
 *   >> GRANT REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'replication_user'@'%' IDENTIFIED BY 'replication_password';
 **/

/**
 * Bu SQL komutu, SET SQL_LOG_BIN=0;, MySQL veritabanında kullanılır ve ikili günlük kaydını (binary logging) devre dışı bırakır. 
 * İkili günlük kaydı, veritabanı işlemlerinin bir günlük dosyasına kaydedilmesini sağlar ve genellikle replikasyon ve veri kurtarma işlemleri için kullanılır. 
 * Bu komut, geçici olarak bu kaydın yapılmamasını sağlar.
 * Bu komut genellikle master instance üzerinde kullanılır çünkü binary loglar, replikasyon için gereklidir ve master instance üzerinde yapılan değişikliklerin 
 * slave instance'lara aktarılmasını sağlar. Slave instance üzerinde bu komutu kullanmanıza gerek yoktur çünkü slave instance zaten master'dan gelen binary logları okuyarak senkronize olur. 
 **/
SET SQL_LOG_BIN=0;

-- Monitor kullanıcısı
/**
 * ProxySQL içinde proxysql_monitor kullanıcısı, proxysql.cnf dosyasında tanımlı 
 * kullanıcı adı (monitor_username) ve şifresiyle (monitor_password) eşleşmelidir.
 * 
 * Bu kullanıcı Mysql sunucularında (master ve slave) monitor kullanıcısı olarak
 * kullanılacaktır. Bu kullanıcılar, ProxySQL tarafından MySQL sunucularını izlemek için kullanılır.
 **/
CREATE USER IF NOT EXISTS 'proxysql_monitor'@'%' IDENTIFIED BY 'monitor_pass123';

/**
 * REPLICATION CLIENT yetkisi, bir kullanıcıya sadece replikasyon durumunu ve binlog dosyalarını sorgulama izni verir. 
 * Bu yetki, replikasyon yapılandırmalarını izlemek ve durumlarını kontrol etmek için kullanılır.
 * >>> Ancak, bir sunucuyu başka bir sunucuya slave olarak yapılandırmak için yeterli değildir. <<<
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

-- Uygulama kullanıcısı (proxysql önünde çalışacak uygulamanın veritabanına erişmek için kullanacağı kullanıcı)
CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_pass123';
-- Tüm veritabanlarına erişim izni verdik çünkü phpmyadmin ile tüm veritabanlarını görmek istiyoruz
-- Eğer redmine gibi bir uygulama kullanıyorsanız sadece `redmine` veritabanına erişim izni vermek için:
--     >>> GRANT ALL PRIVILEGES ON `redmine`.* TO 'app_user'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%' WITH GRANT OPTION; 

/**
 * GRANT SUPER: GRANT komutu, MySQL kullanıcılarına ayrıcalıklar atamak için kullanılır. 
 * SUPER ayrıcalığı, kullanıcının çeşitli üst düzey işlemleri gerçekleştirmesine izin veren güçlü bir yönetim ayrıcalığıdır. 
 * Bu işlemler arasında sunucuyu kapatma, küresel sunucu değişkenlerini değiştirme, iş parçacıklarını sonlandırma ve daha fazlası bulunur. 
 * Genellikle veritabanı yöneticileri için ayrılmıştır.
 **/
GRANT SUPER ON *.* TO 'app_user'@'%';

-- Replikasyon kullanıcısı
CREATE USER IF NOT EXISTS 'rep_user'@'%' IDENTIFIED BY 'YourStrongPassword';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'rep_user'@'%';


FLUSH PRIVILEGES;


SET SQL_LOG_BIN=1;