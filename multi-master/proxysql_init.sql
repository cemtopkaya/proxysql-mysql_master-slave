-- Monitor kullanıcısını tüm MySQL sunucularında oluştur
INSERT INTO mysql_users (username,password,default_hostgroup) VALUES ('monitor','monitor',10);

-- Redmine kullanıcısını ekle
INSERT INTO mysql_users (username,password,default_hostgroup,transaction_persistent,fast_forward) 
VALUES ('redmine','redmine_password',10,1,1);

-- MySQL sunucularını ekle
INSERT INTO mysql_servers (hostname,port,hostgroup_id) VALUES ('master1',3306,10);
INSERT INTO mysql_servers (hostname,port,hostgroup_id) VALUES ('master2',3306,10);
INSERT INTO mysql_servers (hostname,port,hostgroup_id) VALUES ('master3',3306,10);
INSERT INTO mysql_servers (hostname,port,hostgroup_id) VALUES ('slave',3306,20);

-- Değişiklikleri uygula
LOAD MYSQL USERS TO RUNTIME;
SAVE MYSQL USERS TO DISK;

LOAD MYSQL SERVERS TO RUNTIME;
SAVE MYSQL SERVERS TO DISK;

-- Sunucuları kontrol et
SELECT * FROM mysql_servers;
SELECT * FROM mysql_users;
SELECT * FROM mysql_query_rules; 