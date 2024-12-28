#!/bin/bash
set -ex

# MySQL node hazırlık kontrolü
wait_for_mysql() {
    local host=$1
    local max_attempts=30
    local attempt=1
    
    echo "$host MySQL sunucusu hazır olana kadar bekleniyor..."
    while ! mysqladmin ping -h"$host" -uroot -proot_password --silent; do
        if [ $attempt -eq $max_attempts ]; then
            echo "$host MySQL sunucusu $max_attempts denemeden sonra hala hazır değil"
            exit 1
        fi
        echo "Deneme $attempt/$max_attempts: $host MySQL sunucusu henüz hazır değil..."
        attempt=$((attempt + 1))
        sleep 5
    done
    echo "$host MySQL sunucusu hazır!"
}

# Tüm node'ları bekle
for node in master1 master2 master3; do
    wait_for_mysql $node
done

export MYSQL_PWD=root_password

# Auto-increment ayarlarını başlat
echo "Auto-increment yapılandırması ayarlanıyor..."
mysql -h master1 -uroot -e "
    SET @@GLOBAL.auto_increment_increment=3;
    SET @@GLOBAL.auto_increment_offset=1;"

mysql -h master2 -uroot -e "
    SET @@GLOBAL.auto_increment_increment=3;
    SET @@GLOBAL.auto_increment_offset=2;"

mysql -h master3 -uroot -e "
    SET @@GLOBAL.auto_increment_increment=3;
    SET @@GLOBAL.auto_increment_offset=3;"

# Master1'i başlat
echo "Master1 yapılandırılıyor..."
mysql -h master1 -uroot -e "
    STOP GROUP_REPLICATION;
    RESET MASTER;
    SET GLOBAL super_read_only=0;
    SET GLOBAL read_only=0;
    SET SQL_LOG_BIN=0;

    CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
    GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
    GRANT REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
    GRANT SELECT ON performance_schema.* TO 'repl_user'@'%';
    GRANT SUPER ON *.* TO 'repl_user'@'%';
    FLUSH PRIVILEGES;

    CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123' 
    FOR CHANNEL 'group_replication_recovery';

    SET GLOBAL group_replication_bootstrap_group=ON;
    START GROUP_REPLICATION;
    SET GLOBAL group_replication_bootstrap_group=OFF;
    SET SQL_LOG_BIN=1;"

sleep 30

# Diğer node'ları başlat
for node in master2 master3; do
    echo "$node yapılandırılıyor..."
    mysql -h $node -uroot -e "
    STOP GROUP_REPLICATION;
    RESET MASTER;
    SET GLOBAL super_read_only=0;
    SET GLOBAL read_only=0;
    SET SQL_LOG_BIN=0;

    CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
    GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
    GRANT REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
    GRANT SELECT ON performance_schema.* TO 'repl_user'@'%';
    GRANT SUPER ON *.* TO 'repl_user'@'%';
    FLUSH PRIVILEGES;

    CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123' 
    FOR CHANNEL 'group_replication_recovery';

    START GROUP_REPLICATION;
    SET SQL_LOG_BIN=1;"
    
    sleep 30
done

# Cluster durumunu kontrol et
echo "Cluster son durum kontrolü:"
mysql -h master1 -uroot -e "
SELECT * FROM performance_schema.replication_group_members;"

# Auto-increment ayarlarını kontrol et
echo "Auto-increment ayarları kontrol ediliyor:"
for node in master1 master2 master3; do
    echo "=== $node Auto-Increment Ayarları ==="
    mysql -h $node -uroot -e "
    SHOW VARIABLES LIKE '%auto_increment%';"
done

# Replikasyon testi
echo "Replikasyon testi yapılıyor..."
mysql -h master1 -uroot -e "
CREATE DATABASE IF NOT EXISTS test;
CREATE TABLE IF NOT EXISTS test.rakamlar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kaynak VARCHAR(50),
    olusturma_zamani TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);"

for node in master1 master2 master3; do
    mysql -h $node -uroot -e "
    INSERT INTO test.rakamlar (kaynak) VALUES ('${node}_den');"
done

echo "Test sonuçları kontrol ediliyor:"
mysql -h master1 -uroot -e "
SELECT * FROM test.rakamlar ORDER BY id;"

unset MYSQL_PWD