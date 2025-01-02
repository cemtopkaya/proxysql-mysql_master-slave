/**
 * Binary logging'i geçici olarak devre dışı bırak
 * Bu, başlangıç yapılandırması sırasında gereksiz log oluşumunu engeller
 */
SET SQL_LOG_BIN=0;


FLUSH PRIVILEGES;

-- Replikasyonu durdur ve sıfırla
STOP SLAVE;
RESET SLAVE;

/**
 * Master'a bağlanma bilgileri
 * 
 * Not: MASTER_LOG_FILE ve MASTER_LOG_POS belirtilmediğinde,
 * slave otomatik olarak master'ın mevcut durumundan başlar.
 * Bu sayede:
 * 1. Her seferinde manuel pozisyon belirtmeye gerek kalmaz
 * 2. Master yeniden başladığında sorun yaşanmaz
 * 3. Binlog dosyaları değiştiğinde yapılandırmayı güncellemeye gerek kalmaz
 */
CHANGE MASTER TO
  MASTER_HOST='mysql-master',
  MASTER_USER='rep_user',
  MASTER_PASSWORD='YourStrongPassword',
  MASTER_PORT=3306;

START SLAVE;

SHOW SLAVE STATUS\G

SET SQL_LOG_BIN=1;