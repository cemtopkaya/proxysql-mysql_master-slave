## Replikasyon Testi

1. **Servislerin Durumunu Kontrol Etme**:
```bash
docker compose ps
```

2. **Master Durumunu Kontrol Etme**:
```bash
docker compose exec master1 mysql -uroot -proot_password -e "SHOW MASTER STATUS\G;"
```

3. **Slave Durumunu Kontrol Etme**:
```bash
docker compose exec slave mysql -uroot -proot_password -e "SHOW SLAVE STATUS\G;"
```

4. **Test Veritabanı Oluşturma**:
```bash
docker compose exec master1 mysql -uroot -proot_password -e "
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
docker compose exec master1 mysql -uroot -proot_password -e "
USE test_db;
INSERT INTO users (name) VALUES ('John Doe');
INSERT INTO users (name) VALUES ('Jane Smith');"
```

6. **Replikasyonu Kontrol Etme**:
```bash
docker compose exec slave mysql -uroot -proot_password -e "
USE test_db;
SELECT * FROM users;"
docker compose exec master2 mysql -uroot -proot_password -e "
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
docker compose exec master1 mysql -h proxysql -P6033 -uapp_user -papp_pass123 -e "
USE test_db;
INSERT INTO users (name) VALUES ('Robert Brown');"
```

4. **ProxySQL Üzerinden Okuma Testi**:
```bash
docker compose exec master1 mysql -h proxysql -P6033 -uapp_user -papp_pass123 -e "
USE test_db;
SELECT * FROM users;"
```
