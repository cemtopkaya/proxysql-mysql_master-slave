-- Monitor kullanıcısı oluşturma
CREATE USER 'proxysql_monitor'@'%' IDENTIFIED BY 'monitor_pass123';
GRANT REPLICATION CLIENT ON *.* TO 'proxysql_monitor'@'%';
GRANT SELECT ON mysql.* TO 'proxysql_monitor'@'%';

-- Uygulama kullanıcısı oluşturma
CREATE USER 'app_user'@'%' IDENTIFIED BY 'app_pass123';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydatabase.* TO 'app_user'@'%';