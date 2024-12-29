## Replikasyon Mimarileri

1. Single-Primary Mode
- Tek bir primary (master) node yazma yapabilir
- Diğer tüm nodlar read-only modda çalışır
- Primary node seçimi otomatik yapılır

2. Multi-Primary Mode
- Tüm nodlar yazma yapabilir
- Eşit yetkiye sahip nodlar
- Conflict yönetimi gerekir

3. Master-Slave (Async)
- Klasik master-slave replikasyonu
- Asenkron çalışır
- Slave'ler read-only

4. Master-Slave (Semi-Sync)
- En az bir slave'den onay bekler
- Veri güvenliği daha yüksek
- Performans etkisi var

5. Multi-Source Replication
- Bir slave birden fazla master'dan veri alabilir
- Kompleks topolojiler mümkün
- Yönetimi zor

---

## my.cnf Satır Sıraları

1. Önce server_id tanımlanmalı
```conf
server_id=1
bind-address=0.0.0.0
```

2. Plugin yükleme
```conf
plugin-load-add=group_replication.so
```

3. GTID ayarları
```conf
gtid_mode=ON
enforce_gtid_consistency=ON
```

4. Replikasyon Ayarları
```conf
master_info_repository=TABLE
relay_log_info_repository=TABLE
```

5. Group Replication Ayarları
```conf
loose_group_replication_group_name="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee" # MySQL 5.7 için
group_replication_group_name="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"       # MySQL 8.0 için
```

---
### server_id

```conf
server_id=1
```

`server_id`, MySQL replication (çoğaltma) yapılandırmasında önemli bir parametredir. 

#### Kullanım Amaçları:

- **Replication:** Master-Slave mimarisinde her sunucuyu benzersiz şekilde tanımlamak için
```conf
   # Master sunucu için
   server_id=1
```

```conf
   # Slave sunucular için
   server_id=2  # ilk slave
   server_id=3  # ikinci slave
```

  
- **Group Replication:** 
  o MySQL grup replikasyonunda node'ları ayırt etmek için.
  o Replikasyon topluluğundaki her sunucu benzersiz bir server_id'ye sahip olmalıdır.
  o 0 değeri genellikle replikasyon için kullanılamaz.
  o Çalışan MySQL sunucusunda dinamik olarak değiştirilebilir.

```shell
    mysql> SELECT @@server_id;
    +-------------+
    | @@server_id |
    +-------------+
    |           1 |
    +-------------+
    
    mysql> SET GLOBAL server_id = 2;
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> SELECT @@server_id;
    +-------------+
    | @@server_id |
    +-------------+
    |           2 |
    +-------------+
```

- **Binary Log Events:** Binary log olaylarının kaynağını belirlemek için


## Ağ Ayarları

#### bind-address
```conf
bind-address=0.0.0.0
```

Ağ Ayarları: `0.0.0.0`'le tüm network interface'lerinden bağlantı kabul eder

```shell
    mysql> SELECT @@bind_address;
    +----------------+
    | @@bind_address |
    +----------------+
    | 0.0.0.0        |
    +----------------+
    1 row in set (0.00 sec)
    
    mysql> SHOW VARIABLES LIKE 'bind_address';
    +---------------+---------+
    | Variable_name | Value   |
    +---------------+---------+
    | bind_address  | 0.0.0.0 |
    +---------------+---------+
    1 row in set (0.01 sec)
```

#### port

Mysql'in hangi port üzerinden ayaklanacağını belirler.
`mysql` parametresi olarak `--port=3310` şeklinde verilebilir.

```conf
port=3306
```

```shell
mysql> SHOW VARIABLES LIKE 'port';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| port          | 3310  |
+---------------+-------+
1 row in set (0.00 sec)

mysql> SELECT @@port;
+--------+
| @@port |
+--------+
|   3310 |
+--------+
1 row in set (0.00 sec)
```

#### socket 

```conf
socket=/var/run/mysqld/mysqld.sock
```

Socket Dosyası Nedir?
- Unix/Linux sistemlerinde MySQL sunucusu ve istemcisi arasında yerel iletişimi sağlayan özel bir dosyadır
- TCP/IP bağlantısına göre daha hızlı ve güvenlidir çünkü ağ katmanını kullanmaz
- Sadece aynı makine üzerindeki bağlantılar için kullanılabilir
- MySQL istemcisi `-h localhost` parametresiyle bağlanırken şu sırayla bağlantı dener:
   o Önce Unix socket dosyası üzerinden bağlantı dener
   o Socket bağlantısı başarısız olursa, TCP/IP üzerinden `127.0.0.1`'e bağlanmayı dener

Önemli Noktalar
- Socket dosyası genelde `/var/run/mysqld/mysqld.sock` konumundadır
- Socket dosyasının konumu değişirse, istemci bağlantı yapamayabilir
- Performans kritik uygulamalarda yerel bağlantılar için socket kullanmak önerilir

```shell
mysql> SHOW VARIABLES LIKE 'socket';
+---------------+-----------------------------+
| Variable_name | Value                       |
+---------------+-----------------------------+
| socket        | /var/run/mysqld/mysqld.sock |
+---------------+-----------------------------+
1 row in set (0.00 sec)

mysql> SELECT @@socket;
+-----------------------------+
| @@socket                    |
+-----------------------------+
| /var/run/mysqld/mysqld.sock |
+-----------------------------+
1 row in set (0.00 sec)
 ```

 veya

 ```shell
sh-4.2# ls -al /var/run/mysqld/mysqld.sock
srwxrwxrwx 1 mysql mysql 0 Dec 28 21:01 /var/run/mysqld/mysqld.sock
 ```


### Plugins

```conf
plugin-load-add=group_replication.so
```

MySQL sunucusu konfigürasyon dosyasını yukarıdan aşağıya doğru okur.

MySQL konfigürasyonunda plugin-load-add direktifinin erken yüklenmesinin nedenleri:
1. **Plugin Bağımlılıkları:** Group Replication plugin'i MySQL sunucusunun başlangıç aşamasında yüklenmeli. Eğer bu plugin zamanında yüklenmezse, ona bağımlı olan diğer replikasyon ayarları ve özellikler düzgün çalışmayabilir.

1. **Sunucu Başlangıç Sırası:** Plugin'lerin sunucunun geri kalanı başlamadan önce yüklenmesi gerekir, bu yüzden `plugin-load-add` direktifi dosyanın başlarında yer almalıdır.

1. **Hata Önleme:** Eğer plugin yüklemesi gecikirse ve bağımlı ayarlar daha önce okunursa, MySQL başlangıç hatalarına veya beklenmedik davranışlara neden olabilir.

Eklentinin yüklü olduğunu şöyle bulabilirsiniz:
1. `SELECT * FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME LIKE 'group_replication';` sorgusuyla
2. Tüm eklentileri `SHOW PLUGINS;` sorgusuyla listeleyebilirsiniz.
3. `find / -name group_replication.so` terminal komutuyla
4. `/usr/lib64/mysql/plugin/group_replication.so` dosya yoluna bakarak



## Group Replication

### gtid_mode

```conf
gtid_mode=ON
```

GTID (Global Transaction ID) modunu aktif eder

**GTID'nin Replikasyona Katkıları**
- Transaction takibi kolaylaşır
- Failover senaryoları basitleşir
- Replikasyon hata ayıklama kolaylaşır
- Multi-source replikasyonu mümkün kılar

**Replikasyon Olmadan**
- GTID gerekli değildir
- Standalone sunucularda kullanılmaz
- Performance impact'i olabilir

```shell
mysql> SHOW VARIABLES LIKE 'gtid_mode';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| gtid_mode     | ON    |
+---------------+-------+
1 row in set (0.00 sec)

mysql> SELECT @@gtid_mode;
+-------------+
| @@gtid_mode |
+-------------+
| ON          |
+-------------+
1 row in set (0.00 sec)
```

### enforce_gtid_consistency

```conf
enforce_gtid_consistency=ON
```
GTID tutarlılığını zorunlu kılar
1. Alabileceği Değerler:
   OFF  : GTID tutarlılığı kontrol edilmez
   ON   : GTID tutarlılığını zorunlu kılar
   WARN : Tutarsızlık durumunda sadece uyarı verir

2. Amacı:
GTID tutarlılığını korumak için bazı SQL işlemlerini kısıtlar:
- CREATE TABLE ... SELECT
- CREATE TEMPORARY TABLE
- Transaction içermeyen UPDATE/DELETE
- Non-deterministic functions (UUID(), RAND() vb.)

3. OFF Durumunda:
- GTID tutarlılığı bozulabilir
- Replikasyon hataları oluşabilir
- Master-slave senkronizasyonu bozulabilir
- Group replication çalışmaz

```shell
mysql> SHOW VARIABLES LIKE 'enforce_gtid_consistency';
+--------------------------+-------+
| Variable_name            | Value |
+--------------------------+-------+
| enforce_gtid_consistency | ON    |
+--------------------------+-------+
1 row in set (0.00 sec)
 
mysql> SELECT @@enforce_gtid_consistency;
+----------------------------+
| @@enforce_gtid_consistency |
+----------------------------+
| ON                         |
+----------------------------+
1 row in set (0.00 sec)
```

### master_info_repository

```conf
master_info_repository=TABLE
```

Slave sunucular, master sunucunun bilgilerini tablo/dosyada saklamak zorundadır.

**Saklanan Master Bilgileri:**
- Master sunucusunun host adı/IP adresi
- Master sunucusunun port numarası
- Replikasyon için kullanılan kullanıcı adı ve şifresi
- Binary log dosya adı
- Binary log pozisyonu
- SSL/TLS bağlantı bilgileri
- Relay log bilgileri

**Master-Slave Replikasyonunda:**
- Sadece slave'ler master bilgilerini saklar
- Master sunucular slave bilgilerini saklamaz
 
**Group Replication (Örneğin 3 Master + 5 Slave) durumunda:**
- Her grup üyesi diğer üyelerin bilgilerini saklar
- 3 master birbirlerinin bilgilerini saklar
- 5 slave tüm master'ların bilgilerini saklar
- Multi-master yapıda her node hem master hem slave rolündedir

```conf
# Group replication için her node'da olmalı
master_info_repository=TABLE
relay_log_info_repository=TABLE

# Group replication üyeleri
group_replication_group_seeds="master1:33061,master2:33061,master3:33061"

# Multi-source replication için slave'lerde
master_info_repository=TABLE
relay_log_info_repository=TABLE
```

*Önemli Notlar:*
- `TABLE` seçeneği MySQL 8.0'dan itibaren varsayılan ayardır
- `TABLE` kullanımı daha güvenlidir çünkü bilgiler mysql sistem tablolarında (`mysql.slave_master_info`) saklanır
- `FILE` seçeneği eski sürümlerde kullanılırdı ve bilgiler `master.info` dosyasında saklanırdı
- MySQL 8.0.23'ten itibaren `FILE` seçeneği kullanımdan kaldırılmıştır

```shell
mysql> SHOW VARIABLES LIKE 'master_info_repository';
+------------------------+-------+
| Variable_name          | Value |
+------------------------+-------+
| master_info_repository | TABLE |
+------------------------+-------+
1 row in set (0.00 sec)

mysql> SELECT @@master_info_repository;
+--------------------------+
| @@master_info_repository |
+--------------------------+
| TABLE                    |
+--------------------------+
1 row in set (0.00 sec)

mysql> SHOW VARIABLES LIKE 'relay_log_info_repository';
+---------------------------+-------+
| Variable_name             | Value |
+---------------------------+-------+
| relay_log_info_repository | TABLE |
+---------------------------+-------+
1 row in set (0.00 sec)

mysql> SELECT @@relay_log_info_repository;
+-----------------------------+
| @@relay_log_info_repository |
+-----------------------------+
| TABLE                       |
+-----------------------------+
1 row in set (0.00 sec)

mysql> SELECT @@group_replication_group_seeds;
+---------------------------------+
| @@group_replication_group_seeds |
+---------------------------------+
|                                 |
+---------------------------------+
1 row in set (0.00 sec)
```


### Relay Log

```conf
relay_log_info_repository=TABLE
```

**Relay Log Nedir?**
- Slave sunuculardaki ara binary loglar
- Master'ın binary log'undan kopyalanan olayları içerir
- Replikasyon sürecinde kullanılır

**Amaç:**
- Master ve slave arasında tampon görevi görür
- Veri tutarlılığını sağlamaya yardımcı olur
- Asenkron replikasyona olanak tanır
- Relay log pozisyonlarını ve durumunu saklar
- Slave sunucunun master'dan aldığı verilerin izlenmesini sağlar

`relay_log_info_repository` Relay log bilgilerini tabloda saklar (dosya yerine)

**Depolama Seçenekleri:**
- *TABLE*: MySQL sistem tablolarında saklar (`mysql.slave_relay_log_info`)
- *FILE*: Dosya sisteminde saklar (eski yöntem, deprecated)

**Saklanan Bilgiler:**
- Relay log dosya adı
    `relay_log=/var/log/mysql/mysql-relay-bin`
- Relay log pozisyonu
    `relay_log_index=/var/log/mysql/mysql-relay-bin.index`
- Master log dosya adı
- Master log pozisyonu
- SQL thread durumu

> A[Master Binary Log] --> B[IO Thread] --> C[Relay Log] --> D[SQL Thread] --> E[Slave Database]

```conf
[mysqld]
# Relay log base ayarları
relay_log=/var/log/mysql/mysql-relay-bin
relay_log_index=/var/log/mysql/mysql-relay-bin.index
relay_log_info_repository=TABLE

# Multi-master için özel ayarlar
log_slave_updates=ON          # Relay logdan gelen değişiklikleri binary loga yazar. Multi-master için kritik
relay_log_purge=ON            # Eski relay logları otomatik temizler
sync_relay_log=1              # Her relay log yazımından sonra diske sync eder. Veri güvenliği için önemli
sync_relay_log_info=1         # Relay log bilgilerini her değişimde diske sync eder
relay_log_recovery=ON         # Crash sonrası relay log kurtarma aktif. Crash recovery için önemli.
max_relay_log_size=100M       # Maksimum relay log boyutu
relay_log_space_limit=0       # Relay log toplam boyut sınırı (0=sınırsız)

# Master info repository ayarları
master_info_repository=TABLE   # Master bilgilerini tabloda sakla
```


#### relay_log

Multi-master için relay log ayarları

```conf
relay_log=mysql-relay-bin
relay_log_index=mysql-relay-bin.index
log_slave_updates=ON
```


```shell
mysql> SHOW VARIABLES LIKE 'relay_log';
+---------------+-----------------+
| Variable_name | Value           |
+---------------+-----------------+
| relay_log     | mysql-relay-bin |
+---------------+-----------------+
1 row in set (0.00 sec)

mysql> SELECT @@relay_log;
+-------------+
| @@relay_log |
+-------------+
| NULL        |
+-------------+
1 row in set (0.00 sec)

mysql> SHOW VARIABLES LIKE 'relay_log_index';
+-----------------+--------------------------------------+
| Variable_name   | Value                                |
+-----------------+--------------------------------------+
| relay_log_index | /var/lib/mysql/mysql-relay-bin.index |
+-----------------+--------------------------------------+
1 row in set (0.01 sec)

mysql> SELECT @@relay_log_index;
+---------------------------------------------+
| @@relay_log_index                           |
+---------------------------------------------+
| /var/lib/mysql/f0a01f8e4582-relay-bin.index |
+---------------------------------------------+
1 row in set (0.00 sec)

mysql> SHOW VARIABLES LIKE 'log_slave_updates';
+-------------------+-------+
| Variable_name     | Value |
+-------------------+-------+
| log_slave_updates | ON    |
+-------------------+-------+
1 row in set (0.00 sec)

mysql> SELECT @@log_slave_updates;
+---------------------+
| @@log_slave_updates |
+---------------------+
|                   0 |
+---------------------+
1 row in set (0.00 sec)
```

### transaction_write_set_extraction

```conf
transaction_write_set_extraction=XXHASH64
```

Transaction write setleri için hash algoritmasını belirler

**Alabileceği Değerler:**
- *OFF*: Devre dışı (Group Replication çalışmaz. Hash hesaplama ve performans etkisi YOK!)
- *MURMUR32*: MurmurHash3_x86_32 algoritması (daha yavaş hash hesaplama, daha fazla CPU kullanımı. Yani düşük performans ancak eski sistemlerle uyumluluk sağlar.)
- *XXHASH64*: xxHash64 algoritması (önerilen. Daha hızlı hash algoritması. Group Replication için en iyi performans)

```shell
mysql> SHOW VARIABLES LIKE 'transaction_write_set_extraction';
+----------------------------------+----------+
| Variable_name                    | Value    |
+----------------------------------+----------+
| transaction_write_set_extraction | XXHASH64 |
+----------------------------------+----------+
1 row in set (0.00 sec)
```


# Group Replication Ayarları

5.7 sürümünde başlarına loose_ gelecek, sonrakilerde gidecek
`group_replication_group_name="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"`

yerine

`loose_group_replication_group_name="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"`
gelecek.

### group_replication_group_name

```conf
loose_group_replication_group_name="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
```

Group Replication için benzersiz grup ID'si
Grup için benzersiz UUID belirler. Tüm grup üyelerinde aynı olmalıdır.

**loose_ öneki:**
- MySQL 5.7'de gerekli
- MySQL başlangıçta bu parametreleri bulamazsa hata vermeden devam etmesini sağlar
- Plugin yüklenemezse hata vermesini engeller
- MySQL 8.0'da gerekli değil

```shell
mysql> SHOW VARIABLES LIKE 'group_replication_group_name';
+------------------------------+--------------------------------------+
| Variable_name                | Value                                |
+------------------------------+--------------------------------------+
| group_replication_group_name | aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee |
+------------------------------+--------------------------------------+
1 row in set (0.00 sec)
```



### group_replication_start_on_boot

```conf
loose_group_replication_start_on_boot=ON
```

Sunucu başlangıcında Group Replication'ı otomatik başlatmaz

```shell
mysql> SHOW VARIABLES LIKE 'group_replication_start_on_boot';
+---------------------------------+-------+
| Variable_name                   | Value |
+---------------------------------+-------+
| group_replication_start_on_boot | ON   |
+---------------------------------+-------+
1 row in set (0.00 sec)

mysql> SELECT @@group_replication_start_on_boot;
+-----------------------------------+
| @@group_replication_start_on_boot |
+-----------------------------------+
|                                 1 |
+-----------------------------------+
1 row in set (0.00 sec)
```

### group_replication_bootstrap_group

```conf
loose_group_replication_bootstrap_group=ON
```

İlk sunucunun grup bootstrap'ını yapmasını sağlar

```shell
mysql> SHOW VARIABLES LIKE 'group_replication_bootstrap_group';
+-----------------------------------+-------+
| Variable_name                     | Value |
+-----------------------------------+-------+
| group_replication_bootstrap_group | ON    |
+-----------------------------------+-------+
1 row in set (0.00 sec)
```


### loose_group_replication_single_primary_mode

```conf
loose_group_replication_single_primary_mode=OFF 
```

**Amacı:**
- MySQL Group Replication'da çoklu master (multi-master) mimarisini etkinleştirir.
- Tüm nodlar eşit yetkiye sahip olur, tüm grup üyelerinin write işlemi yapmasına izin verir.
- Her node hem okuma hem yazma yapabilir
- Single-primary modunu devre dışı bırakır
- Bu ayar genellikle `group_replication_enforce_update_everywhere_checks=TRUE` ile birlikte kullanılır.

```shell
mysql> SHOW VARIABLES LIKE 'group_replication_single_primary_mode';
+---------------------------------------+-------+
| Variable_name                         | Value |
+---------------------------------------+-------+
| group_replication_single_primary_mode | OFF   |
+---------------------------------------+-------+
1 row in set (0.00 sec)
```


### group_replication_enforce_update_everywhere_checks

```conf
loose_group_replication_enforce_update_everywhere_checks=TRUE
```

Tüm nodların write yapabilmesini sağlar

```shell
mysql> SHOW VARIABLES LIKE 'group_replication_enforce_update_everywhere_checks';
+----------------------------------------------------+-------+
| Variable_name                                      | Value |
+----------------------------------------------------+-------+
| group_replication_enforce_update_everywhere_checks | ON    |
+----------------------------------------------------+-------+
1 row in set (0.00 sec)
```

### group_replication_local_address

```conf
loose_group_replication_local_address="master1:24901"
```

Bu sunucunun group replication için dinleyeceği adres
- Bu parametre, sunucunun Group Replication için diğer grup üyeleriyle iletişim kuracağı yerel adres ve port numarasını belirtir
- Format: "hostname:port" veya "IP:port" şeklindedir
- Port numarası MySQL'in standart port numarasından (3306) farklı olmalıdır
- Örneğin: "192.168.1.10:33061" veya "server1.domain.com:33061"

```shell
mysql> SHOW VARIABLES LIKE 'group_replication_local_address';
+---------------------------------+---------------+
| Variable_name                   | Value         |
+---------------------------------+---------------+
| group_replication_local_address | master1:24901 |
+---------------------------------+---------------+
1 row in set (0.00 sec)
```

### group_replication_group_seeds

```conf
loose_group_replication_group_seeds="master1:24901,master2:24901,master3:24901"
```

Gruptaki diğer sunucuların adresleri
- Bu parametre, gruptaki diğer sunucuların adreslerini içeren bir liste tanımlar
- Yeni bir üye gruba katılmak istediğinde, bu listedeki adresler üzerinden iletişim kurmaya çalışır
- Format: "host1:port1,host2:port2,..." şeklinde virgülle ayrılmış listedir
- Tüm grup üyelerinin adreslerini içermesi önerilir
- Örnek: "server1:33061,server2:33061,server3:33061"

```shell
mysql> SHOW VARIABLES LIKE 'group_replication_group_seeds';
+-------------------------------+-------------------------------------------+
| Variable_name                 | Value                                     |
+-------------------------------+-------------------------------------------+
| group_replication_group_seeds | master1:24901,master2:24901,master3:24901 |
+-------------------------------+-------------------------------------------+
1 row in set (0.00 sec)
```


### group_replication_ip_whitelist

```conf
loose_group_replication_ip_whitelist="0.0.0.0/0"
```

Group replication için IP whitelist (tüm IP'lere izin verir)

```shell
mysql> SHOW VARIABLES LIKE 'group_replication_ip_whitelist';
+--------------------------------+-----------+
| Variable_name                  | Value     |
+--------------------------------+-----------+
| group_replication_ip_whitelist | 0.0.0.0/0 |
+--------------------------------+-----------+
1 row in set (0.00 sec)
```


## Binlog Ayarları 

### log_bin

```conf
log_bin=mysql_bin
```

Binary log dosyasının adı
`log_bin` ayarı MySQL’de genellikle `ON`/`OFF` veya bir dosya yolu olarak kullanılabilir. 
Bu ayar etkinleştirildiğinde MySQL, veritabanında yapılan işlemleri ikili formatta kaydederek replikasyon ve nokta-atışı geri yükleme (point-in-time recovery) gibi işlemlere olanak sağlar.
`log_bin` MySQL'de binary logging'i kontrol eden önemli bir parametredir.
Binary log, MySQL'de yapılan tüm değişiklikleri (INSERT, UPDATE, DELETE vb.) kronolojik sırayla kaydeden bir dosyadır
Replikasyon ve veri kurtarma işlemleri için kritik öneme sahiptir.

# Auto increment değerlerinin artış miktarı (node sayısı kadar)

```conf
auto_increment_increment=3
```

# Bu sunucu için auto increment başlangıç offseti

```conf
auto_increment_offset=1
```

# Binary log checksum'ı devre dışı bırakır

```conf
binlog_checksum=NONE
```

### binlog_format

```conf
binlog_format=ROW
```

Binary log format'ını ROW olarak ayarlar (Statement veya Mixed yerine)
The binlog_format parameter can have three possible values:

**ROW (Selected in your configuration)**
 - Logs the actual changes made to rows
 - Most reliable option
 - Higher storage requirements
 - Best for data consistency and replication

**STATEMENT**
 - Logs SQL statements that modify data
 - Less storage space needed
 - Can cause replication issues with certain functions
 - Not safe for all scenarios

**MIXED**
 - Uses STATEMENT by default
 - Automatically switches to ROW format when needed
 - A compromise between storage space and reliability


# Diğer Ayarlar

```conf
super_read_only=OFF
```

Read-only modu kapatır


---
2024-12-29T02:14:30.772555Z 39 [ERROR] Plugin group_replication reported: 'binlog_checksum should be NONE for Group Replication'

To resolve the error binlog_checksum should be NONE for Group Replication, you need to set the binlog_checksum parameter to NONE in your MySQL configuration. 
