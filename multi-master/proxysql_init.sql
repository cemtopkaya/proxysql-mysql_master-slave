-- Monitor kullanıcısını tüm MySQL sunucularında oluştur
INSERT INTO mysql_users (username,password,default_hostgroup) VALUES ('monitor','monitor',10);

-- Değişiklikleri uygula
LOAD MYSQL USERS TO RUNTIME;
SAVE MYSQL USERS TO DISK;

-- Sunucuları kontrol et
SELECT * FROM mysql_servers;
SELECT * FROM mysql_users;
SELECT * FROM mysql_query_rules; 