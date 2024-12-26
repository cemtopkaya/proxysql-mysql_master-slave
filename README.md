### ProxySQL

proxysql başlarken proxysql.cnf dosyasında yer alan bilgilere göre kullanıcı adı ve şifresiyle erişilebilir:
```conf
admin_variables=
{
  admin_credentials="admin:admin"
  mysql_ifaces="0.0.0.0:6032"
}
```

Aynı ayar dosyasında `mysql_servers`, `mysql_users` ve `mysql_query_rules` tablolarını çekerek oluşturacaktır:
```conf
# Write için Mysql MASTER > hostgroup = 1
# Read için Mysql SLAVE > hostgroup = 2
mysql_servers =
(
  { address="mysql-master" , port=3306 , hostgroup=1, max_connections=100 },
  { address="mysql-slave"  , port=3306 , hostgroup=2, max_connections=100 }
)

mysql_users =
(
  { username = "app_user" , password = "app_pass123" , default_hostgroup = 1 , active = 1 }
)

mysql_query_rules =
(
  {
    rule_id=1
    active=1
    match_pattern="^SELECT"
    destination_hostgroup=2
    apply=1
  },
  {
    rule_id=2
    active=1
    match_pattern=".*"
    destination_hostgroup=1
    apply=1
  }
)
```

Yukarıdaki ayarlar proxysql içinde tablolar olarak oluşturulup içinde ilgili kayıtlar yaratılır:

```shell
| mysql_servers                                      |
| mysql_query_rules                                  |
| mysql_users                                        |
```

```shell
MySQL [(none)]> use admin;
Database changed
MySQL [admin]> select * from mysql_users;
+----------+-------------+--------+---------+-------------------+----------------+---------------+------------------------+--------------+---------+----------+-----------------+------------+---------+
| username | password    | active | use_ssl | default_hostgroup | default_schema | schema_locked | transaction_persistent | fast_forward | backend | frontend | max_connections | attributes | comment |
+----------+-------------+--------+---------+-------------------+----------------+---------------+------------------------+--------------+---------+----------+-----------------+------------+---------+
| app_user | app_pass123 | 1      | 0       | 1                 |                | 0             | 1                      | 0            | 1       | 1        | 10000           |            |         |
+----------+-------------+--------+---------+-------------------+----------------+---------------+------------------------+--------------+---------+----------+-----------------+------------+---------+
1 row in set (0.001 sec)

MySQL [admin]> select * from mysql_servers;
+--------------+--------------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
| hostgroup_id | hostname     | port | gtid_port | status | weight | compression | max_connections | max_replication_lag | use_ssl | max_latency_ms | comment |
+--------------+--------------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
| 1            | mysql-master | 3306 | 0         | ONLINE | 1      | 0           | 100             | 0                   | 0       | 0              |         |
| 2            | mysql-slave  | 3306 | 0         | ONLINE | 1      | 0           | 100             | 0                   | 0       | 0              |         |
+--------------+--------------+------+-----------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
2 rows in set (0.000 sec)

MySQL [admin]> select * from mysql_query_rules;
+---------+--------+----------+------------+--------+-------------+------------+------------+--------+--------------+---------------+----------------------+--------------+---------+-----------------+-----------------------+-----------+--------------------+---------------+-----------+---------+---------+-------+-------------------+----------------+------------------+-----------+--------+-------------+-----------+---------------------+-----+-------+------------+---------+
| rule_id | active | username | schemaname | flagIN | client_addr | proxy_addr | proxy_port | digest | match_digest | match_pattern | negate_match_pattern | re_modifiers | flagOUT | replace_pattern | destination_hostgroup | cache_ttl | cache_empty_result | cache_timeout | reconnect | timeout | retries | delay | next_query_flagIN | mirror_flagOUT | mirror_hostgroup | error_msg | OK_msg | sticky_conn | multiplex | gtid_from_hostgroup | log | apply | attributes | comment |
+---------+--------+----------+------------+--------+-------------+------------+------------+--------+--------------+---------------+----------------------+--------------+---------+-----------------+-----------------------+-----------+--------------------+---------------+-----------+---------+---------+-------+-------------------+----------------+------------------+-----------+--------+-------------+-----------+---------------------+-----+-------+------------+---------+
| 1       | 1      | NULL     | NULL       | 0      | NULL        | NULL       | NULL       | NULL   | NULL         | ^SELECT       | 0                    | CASELESS     | NULL    | NULL            | 2                     | NULL      | NULL               | NULL          | NULL      | NULL    | NULL    | NULL  | NULL              | NULL           | NULL             | NULL      | NULL   | NULL        | NULL      | NULL                | NULL | 1     |            | NULL    |
| 2       | 1      | NULL     | NULL       | 0      | NULL        | NULL       | NULL       | NULL   | NULL         | .*            | 0                    | CASELESS     | NULL    | NULL            | 1                     | NULL      | NULL               | NULL          | NULL      | NULL    | NULL    | NULL  | NULL              | NULL           | NULL             | NULL      | NULL   | NULL        | NULL      | NULL                | NULL | 1     |            | NULL    |
+---------+--------+----------+------------+--------+-------------+------------+------------+--------+--------------+---------------+----------------------+--------------+---------+-----------------+-----------------------+-----------+--------------------+---------------+-----------+---------+---------+-------+-------------------+----------------+------------------+-----------+--------+-------------+-----------+---------------------+-----+-------+------------+---------+
2 rows in set (0.001 sec)

MySQL [admin]> 
```


Komut satırından bağlanmak ve DB işlemleri için:

```shell
root@f1afc85c00e3:/# mysql -h 127.0.0.1 -uadmin -padmin -P6032
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 26
Server version: 5.7 (ProxySQL Admin Module)

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MySQL [(none)]> 

MySQL [(none)]> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| admin      |
+------------+
1 row in set (0.000 sec)

MySQL [(none)]> SHOW DATABASES;
+-----+---------------+-------------------------------------+
| seq | name          | file                                |
+-----+---------------+-------------------------------------+
| 0   | main          |                                     |
| 2   | disk          | /var/lib/proxysql/proxysql.db       |
| 3   | stats         |                                     |
| 4   | monitor       |                                     |
| 5   | stats_history | /var/lib/proxysql/proxysql_stats.db |
+-----+---------------+-------------------------------------+
5 rows in set (0.000 sec)

MySQL [(none)]> use admin;
Database changed
MySQL [admin]> SHOW TABLES;
+----------------------------------------------------+
| tables                                             |
+----------------------------------------------------+
| coredump_filters                                   |
| global_variables                                   |
| mysql_aws_aurora_hostgroups                        |
| mysql_collations                                   |
| mysql_firewall_whitelist_rules                     |
| mysql_firewall_whitelist_sqli_fingerprints         |
| mysql_firewall_whitelist_users                     |
| mysql_galera_hostgroups                            |
| mysql_group_replication_hostgroups                 |
| mysql_hostgroup_attributes                         |
| mysql_query_rules                                  |
| mysql_query_rules_fast_routing                     |
| mysql_replication_hostgroups                       |
| mysql_servers                                      |
| mysql_servers_ssl_params                           |
| mysql_users                                        |
| proxysql_servers                                   |
| restapi_routes                                     |
| runtime_checksums_values                           |
| runtime_coredump_filters                           |
| runtime_global_variables                           |
| runtime_mysql_aws_aurora_hostgroups                |
| runtime_mysql_firewall_whitelist_rules             |
| runtime_mysql_firewall_whitelist_sqli_fingerprints |
| runtime_mysql_firewall_whitelist_users             |
| runtime_mysql_galera_hostgroups                    |
| runtime_mysql_group_replication_hostgroups         |
| runtime_mysql_hostgroup_attributes                 |
| runtime_mysql_query_rules                          |
| runtime_mysql_query_rules_fast_routing             |
| runtime_mysql_replication_hostgroups               |
| runtime_mysql_servers                              |
| runtime_mysql_servers_ssl_params                   |
| runtime_mysql_users                                |
| runtime_proxysql_servers                           |
| runtime_restapi_routes                             |
| runtime_scheduler                                  |
| scheduler                                          |
+----------------------------------------------------+
38 rows in set (0.000 sec)

MySQL [admin]> 
```

#### Admin Port (6032)
-- Kullanılabilir tablolar
SHOW TABLES FROM main;

-- Önemli admin tabloları ve bilgileri:
SELECT * FROM mysql_servers;              -- Yapılandırılmış MySQL sunucuları
SELECT * FROM mysql_users;                -- Yapılandırılmış kullanıcılar
SELECT * FROM mysql_query_rules;          -- Query routing kuralları
SELECT * FROM stats.stats_mysql_commands; -- MySQL komut istatistikleri
SELECT * FROM mysql_replication_hostgroups; -- Replikasyon hostgroup'ları
SELECT * FROM stats.stats_mysql_connection_pool; -- Bağlantı havuzu durumu
SELECT * FROM stats.stats_mysql_global;   -- Global istatistikler
SELECT * FROM monitor.mysql_server_connect; -- Sunucu bağlantı logları
SELECT * FROM monitor.mysql_server_ping;   -- Sunucu ping logları

-- Konfigürasyon değişiklikleri için:
LOAD MYSQL USERS TO RUNTIME;             -- Kullanıcı değişikliklerini uygula
LOAD MYSQL SERVERS TO RUNTIME;           -- Sunucu değişikliklerini uygula
LOAD MYSQL QUERY RULES TO RUNTIME;       -- Kural değişikliklerini uygula
SAVE MYSQL USERS TO DISK;                -- Kullanıcıları kalıcı kaydet
SAVE MYSQL SERVERS TO DISK;              -- Sunucuları kalıcı kaydet
SAVE MYSQL QUERY RULES TO DISK;          -- Kuralları kalıcı kaydet

## Replikasyon Testi

1. **Servislerin Durumunu Kontrol Etme**:
```bash
docker compose ps
```

2. **Master Durumunu Kontrol Etme**:
```bash
docker compose exec mysql-master mysql -uroot -proot_password -e "SHOW MASTER STATUS\G"
```

3. **Slave Durumunu Kontrol Etme**:
```bash
docker compose exec mysql-slave mysql -uroot -proot_password -e "SHOW SLAVE STATUS\G"
```

4. **Test Veritabanı Oluşturma**:
```bash
docker compose exec mysql-master mysql -uroot -proot_password -e "
CREATE DATABASE test_db;
USE test_db;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);"
```

5. **Test Verisi Ekleme**:
```bash
docker compose exec mysql-master mysql -uroot -proot_password -e "
USE test_db;
INSERT INTO users (name) VALUES ('John Doe');
INSERT INTO users (name) VALUES ('Jane Smith');"
```

6. **Replikasyonu Kontrol Etme**:
```bash
docker compose exec mysql-slave mysql -uroot -proot_password -e "
USE test_db;
SELECT * FROM users;"
```

## ProxySQL Testi

1. **ProxySQL Admin Arayüzüne Bağlanma**:
```bash
docker compose exec proxysql mysql -h127.0.0.1 -P6032 -uadmin -padmin
```

2. **Server Durumunu Kontrol Etme**:
```sql
SELECT * FROM mysql_servers;
SELECT * FROM mysql_users;
SELECT * FROM mysql_query_rules;
```

3. **ProxySQL Üzerinden Yazma Testi**:
```bash
docker compose exec mysql-master mysql -h proxysql -P6033 -uapp_user -papp_pass123 -e "
USE test_db;
INSERT INTO users (name) VALUES ('Robert Brown');"
```

4. **ProxySQL Üzerinden Okuma Testi**:
```bash
docker compose exec mysql-master mysql -h proxysql -P6033 -uapp_user -papp_pass123 -e "
USE test_db;
SELECT * FROM users;"
```

## phpMyAdmin Erişimi

- URL: http://localhost:8080
- Kullanıcı adı: app_user
- Şifre: app_pass123

## Kullanıcı Bilgileri

### ProxySQL Monitor Kullanıcısı
- Kullanıcı adı: proxysql_monitor
- Şifre: monitor_pass123
- Yetkiler: REPLICATION CLIENT, SELECT ON mysql.*

### Uygulama Kullanıcısı
- Kullanıcı adı: app_user
- Şifre: app_pass123
- Yetkiler: ALL PRIVILEGES

### Replikasyon Kullanıcısı
- Kullanıcı adı: rep_user
- Şifre: YourStrongPassword
- Yetkiler: REPLICATION SLAVE

## Servis Portları

- MySQL Master: 3308
- MySQL Slave: 3307
- ProxySQL Admin: 6032
- ProxySQL MySQL: 6033
- phpMyAdmin: 8080

## Sistemi Durdurma ve Temizleme

```bash
# Servisleri durdur
docker compose down

# Servisleri ve volumeleri temizle
docker compose down -v
```

## Notlar

- ProxySQL, SELECT sorgularını otomatik olarak slave'e yönlendirir
- Diğer tüm sorgular (INSERT, UPDATE, DELETE) master'a yönlendirilir
- Slave sunucusu, master'dan gelen değişiklikleri otomatik olarak replike eder
- phpMyAdmin üzerinden yapılan işlemler ProxySQL üzerinden gerçekleştirilir