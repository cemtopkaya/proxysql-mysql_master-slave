# MySQL Group Replication Test Kılavuzu

## Hızlı Test Komutları

```bash
# 1. Replikasyon durumunu kontrol et
docker exec -it master1 mysql -uroot -proot_password -e "
SELECT * FROM performance_schema.replication_group_members;
"
```

# 2. Test veritabanı oluştur ve veri yaz
```bash
docker exec -it master1 mysql -uroot -proot_password -e "
CREATE DATABASE test;
USE test;
CREATE TABLE kullanicilar (id INT AUTO_INCREMENT PRIMARY KEY, isim VARCHAR(50));
INSERT INTO kullanicilar (isim) VALUES ('kullanici1');
"
```

# 3. Diğer node'larda verileri doğrula
```bash
for node in master2 master3; do
    echo "=== $node Kontrolü ==="
    docker exec -it $node mysql -uroot -proot_password -e "
    SELECT * FROM test.kullanicilar;
    "
done
```