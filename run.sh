#!/bin/bash

# MySQL Group Replication Cluster Kurulum Script'i
# ---------------------------------------------
# Bu script aşağıdaki işlemleri gerçekleştirir:
# 1. MySQL sunucularının hazır olmasını bekler
# 2. Master1'i bootstrap eder
# 3. Diğer master'ları cluster'a ekler
# 4. Cluster durumunu kontrol eder

set -ex  # Hata ayıklama modu aktif

# Bekleme Süresi
# -------------
# MySQL servislerinin tamamen başlaması için bekle
echo "Waiting for MySQL servers to be ready..."
sleep 30

# Master1 Node Kurulumu
# -------------------
# İlk node olduğu için özel işlemler gerekir
echo "Setting up master1..."
mysql -h master1 -uroot -proot_password -e "
# Mevcut Durumu Temizle
STOP GROUP_REPLICATION;           # Varsa çalışan replikasyonu durdur
RESET MASTER;                     # Master durumunu sıfırla

# Read-Only Modları Kapat
SET GLOBAL super_read_only=0;     # Super read-only modu kapat
SET GLOBAL read_only=0;           # Read-only modu kapat
SET SQL_LOG_BIN=0;               # Binary logging geçici devre dışı

# Replikasyon Kullanıcısı Ayarları
CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
GRANT REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
GRANT SELECT ON performance_schema.* TO 'repl_user'@'%';
GRANT SUPER ON *.* TO 'repl_user'@'%';
FLUSH PRIVILEGES;

# Recovery Channel Yapılandırması
CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123' 
FOR CHANNEL 'group_replication_recovery';

# Group Replication Başlatma
SET GLOBAL group_replication_bootstrap_group=ON;
START GROUP_REPLICATION;
SET GLOBAL group_replication_bootstrap_group=OFF;
SET SQL_LOG_BIN=1;"

# Master2 ve Master3 için Bekleme
sleep 30

# Diğer Master Node'ların Kurulumu
for node in master2 master3; do
    echo "Setting up $node..."
    mysql -h $node -uroot -proot_password -e "
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

# Final Kontrol
echo "Final cluster status:"
mysql -h master1 -uroot -proot_password -e "
SELECT * FROM performance_schema.replication_group_members;"