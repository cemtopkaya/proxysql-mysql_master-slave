/**
 * 1 Kullanıcıya ihtiyacım var:
 * 
 * 1. rep_user: Replikasyon kullanıcısı, replikasyon işlemleri için kullanılır. REPLICATION SLAVE yetkisine sahip olmalıdır.
 *   Bu kullanıcı, slave instance'ın master instance ile iletişim kurmasını sağlar.
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

-- Replikasyon kullanıcısı
CREATE USER IF NOT EXISTS 'rep_user'@'%' IDENTIFIED BY 'YourStrongPassword';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'rep_user'@'%';


FLUSH PRIVILEGES;


SET SQL_LOG_BIN=1;