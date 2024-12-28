-- MySQL Group Replication - İlk Kurulum SQL Komutları
-- Bu init.sql, cluster'daki tüm node'lar için gerekli kullanıcıları ve yetkileri oluşturur
-- Her node başlatıldığında otomatik olarak çalıştırılır

-- Binary logging'i geçici olarak devre dışı bırak
-- Bu sayede kullanıcı oluşturma işlemleri replike edilmez
SET SQL_LOG_BIN=0;

-- Kullanıcı Oluşturma
-- ------------------
-- 1. Replikasyon Kullanıcısı (repl_user):
--    - Group Replication için kullanılır
--    - Node'lar arası replikasyon işlemlerini yönetir
CREATE USER IF NOT EXISTS 'repl_user'@'%' 
IDENTIFIED BY 'repl_pass123';

-- 2. ProxySQL Monitor Kullanıcısı:
--    - ProxySQL tarafından node'ların sağlık kontrolü için kullanılır
--    - Sadece monitoring yetkileri vardır
CREATE USER IF NOT EXISTS 'proxysql_monitor'@'%' 
IDENTIFIED BY 'monitor_pass123';

-- 3. Uygulama Kullanıcısı:
--    - Uygulamaların veritabanına erişimi için kullanılır
--    - Gerekli veritabanı işlemlerini yapabilir
CREATE USER IF NOT EXISTS 'app_user'@'%' 
IDENTIFIED BY 'app_pass123';

-- Yetkilendirmeler
-- ---------------
-- Replikasyon kullanıcısı yetkileri:
-- - REPLICATION SLAVE: Binary log okuma ve uygulama
-- - REPLICATION CLIENT: Replikasyon durumunu sorgulama
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
GRANT SUPER ON *.* TO 'repl_user'@'%';
GRANT SELECT ON performance_schema.* TO 'repl_user'@'%';

-- ProxySQL monitor kullanıcısı yetkileri
GRANT SELECT ON *.* TO 'proxysql_monitor'@'%';

-- Uygulama kullanıcısı yetkileri
GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%';

-- Recovery kanal yapılandırması
-- ---------------------------
-- Group Replication recovery işlemleri için kanal ayarları
CHANGE MASTER TO 
MASTER_USER='repl_user', 
MASTER_PASSWORD='repl_pass123' 
FOR CHANNEL 'group_replication_recovery';

-- Yetkileri uygula ve binary logging'i tekrar aktif et
FLUSH PRIVILEGES;
SET SQL_LOG_BIN=1;