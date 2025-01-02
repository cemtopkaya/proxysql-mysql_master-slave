# Başarılı Ayaklandırmanın Çıktısı

```log
master1  | 2025-01-02T01:10:59.982609Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
master1  | 2025-01-02T01:10:59.982616Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
master1  | 2025-01-02T01:10:59.982617Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
master1  | 2025-01-02T01:10:59.983327Z 0 [Warning] CA certificate ca.pem is self signed.
master1  | 2025-01-02T01:10:59.983384Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
master1  | 2025-01-02T01:10:59.993327Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/lib/mysql' in the path is accessible to all OS users. Consider choosing a different directory.
master1  | 2025-01-02T01:10:59.996532Z 0 [Note] Failed to start slave threads for channel ''
slave    | 2025-01-02T01:11:58.484097Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
slave    | 2025-01-02T01:11:58.484115Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
slave    | 2025-01-02T01:11:58.484117Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
master1  | 2025-01-02T01:11:00.001125Z 0 [Note] Event Scheduler: Loaded 0 events
master1  | 2025-01-02T01:11:00.001605Z 0 [Note] mysqld: ready for connections.
slave    | 2025-01-02T01:11:58.484804Z 0 [Warning] CA certificate ca.pem is self signed.
slave    | 2025-01-02T01:11:58.484867Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
slave    | 2025-01-02T01:11:58.494631Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/lib/mysql' in the path is accessible to all OS users. Consider choosing a different directory.
slave    | 2025-01-02T01:11:58.497350Z 0 [Note] Failed to start slave threads for channel ''
slave    | 2025-01-02T01:11:58.502122Z 0 [Note] Event Scheduler: Loaded 0 events
slave    | 2025-01-02T01:11:58.502577Z 0 [Note] mysqld: ready for connections.
slave    | Version: '5.7.44-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server (GPL)
slave    | 2025-01-02 04:11:59+03:00 [Note] [Entrypoint]: Temporary server started.
master2  | 2025-01-02 04:11:21+03:00 [Note] [Entrypoint]: Database files initialized
master2  | 2025-01-02 04:11:21+03:00 [Note] [Entrypoint]: Starting temporary server
master2  | 2025-01-02 04:11:21+03:00 [Note] [Entrypoint]: Waiting for server startup
master2  | 2025-01-02T01:11:21.542380Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
master2  | 2025-01-02T01:11:21.545657Z 0 [Note] mysqld (mysqld 5.7.44-log) starting as process 136 ...
master2  | 2025-01-02T01:11:21.552185Z 0 [Note] InnoDB: PUNCH HOLE support available
master2  | 2025-01-02T01:11:21.552234Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
master2  | 2025-01-02T01:11:21.552240Z 0 [Note] InnoDB: Uses event mutexes
master2  | 2025-01-02T01:11:21.552243Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
master2  | 2025-01-02T01:11:21.552245Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
master2  | 2025-01-02T01:11:21.552248Z 0 [Note] InnoDB: Using Linux native AIO
master2  | 2025-01-02T01:11:21.552866Z 0 [Note] InnoDB: Number of pools: 1
master2  | 2025-01-02T01:11:21.553229Z 0 [Note] InnoDB: Using CPU crc32 instructions
master2  | 2025-01-02T01:11:21.555821Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
master2  | 2025-01-02T01:11:21.571828Z 0 [Note] InnoDB: Completed initialization of buffer pool
master2  | 2025-01-02T01:11:21.576225Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
master2  | 2025-01-02T01:11:21.593180Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
master2  | 2025-01-02T01:11:21.618609Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
master2  | 2025-01-02T01:11:21.618759Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
master2  | 2025-01-02T01:11:21.652534Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
master2  | 2025-01-02T01:11:21.653317Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
master2  | 2025-01-02T01:11:21.653352Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
master2  | 2025-01-02T01:11:21.655326Z 0 [Note] InnoDB: 5.7.44 started; log sequence number 2769157
master2  | 2025-01-02T01:11:21.655573Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
master2  | 2025-01-02T01:11:21.655983Z 0 [Note] Plugin 'FEDERATED' is disabled.
master2  | 2025-01-02T01:11:21.658443Z 0 [Note] InnoDB: Buffer pool(s) load completed at 250102  4:11:21
master2  | 2025-01-02T01:11:21.724714Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
master2  | 2025-01-02T01:11:21.724785Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
master2  | 2025-01-02T01:11:21.724794Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
master2  | 2025-01-02T01:11:21.724797Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
master2  | 2025-01-02T01:11:21.725879Z 0 [Warning] CA certificate ca.pem is self signed.
master2  | 2025-01-02T01:11:21.725982Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
master2  | 2025-01-02T01:11:21.739260Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/lib/mysql' in the path is accessible to all OS users. Consider choosing a different directory.
master2  | 2025-01-02T01:11:21.744150Z 0 [Note] Failed to start slave threads for channel ''
master2  | 2025-01-02T01:11:21.749987Z 0 [Note] Event Scheduler: Loaded 0 events
master2  | 2025-01-02T01:11:21.750787Z 0 [Note] mysqld: ready for connections.
master2  | Version: '5.7.44-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server (GPL)
master2  | 2025-01-02 04:11:22+03:00 [Note] [Entrypoint]: Temporary server started.
master2  | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
master2  | 2025-01-02T01:11:22.425514Z 3 [Note] InnoDB: Stopping purge
master2  | 2025-01-02T01:11:22.450797Z 3 [Note] InnoDB: Resuming purge
master2  | 2025-01-02T01:11:22.489705Z 3 [Note] InnoDB: Stopping purge
master2  | 2025-01-02T01:11:22.514743Z 3 [Note] InnoDB: Resuming purge
master2  | 2025-01-02T01:11:22.553520Z 3 [Note] InnoDB: Stopping purge
master2  | 2025-01-02T01:11:22.579340Z 3 [Note] InnoDB: Resuming purge
master2  | 2025-01-02T01:11:22.622674Z 3 [Note] InnoDB: Stopping purge
master2  | 2025-01-02T01:11:22.649935Z 3 [Note] InnoDB: Resuming purge
master2  | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
master2  | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
master2  | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
master2  | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
master2  | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
master2  | 2025-01-02 04:11:26+03:00 [Note] [Entrypoint]: Creating user repl_user
master2  | 
master2  | 2025-01-02 04:11:26+03:00 [Note] [Entrypoint]: Stopping temporary server
master2  | 2025-01-02T01:11:26.495524Z 0 [Note] Giving 0 client threads a chance to die gracefully
master2  | 2025-01-02T01:11:26.495629Z 0 [Note] Shutting down slave threads
master1  | Version: '5.7.44-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server (GPL)
master1  | 2025-01-02 04:11:00+03:00 [Note] [Entrypoint]: Temporary server started.
master1  | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
master1  | 2025-01-02T01:11:00.652846Z 3 [Note] InnoDB: Stopping purge
master1  | 2025-01-02T01:11:00.672522Z 3 [Note] InnoDB: Resuming purge
master1  | 2025-01-02T01:11:00.703621Z 3 [Note] InnoDB: Stopping purge
master1  | 2025-01-02T01:11:00.722448Z 3 [Note] InnoDB: Resuming purge
master1  | 2025-01-02T01:11:00.753216Z 3 [Note] InnoDB: Stopping purge
master1  | 2025-01-02T01:11:00.773552Z 3 [Note] InnoDB: Resuming purge
master1  | 2025-01-02T01:11:00.804653Z 3 [Note] InnoDB: Stopping purge
master1  | 2025-01-02T01:11:00.824435Z 3 [Note] InnoDB: Resuming purge
master1  | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
master1  | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
master1  | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
master1  | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
master1  | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
master1  | 2025-01-02 04:11:04+03:00 [Note] [Entrypoint]: Creating user repl_user
master1  | 
master1  | 2025-01-02 04:11:04+03:00 [Note] [Entrypoint]: Stopping temporary server
master1  | 2025-01-02T01:11:04.128553Z 0 [Note] Giving 0 client threads a chance to die gracefully
master2  | 2025-01-02T01:11:26.495641Z 0 [Note] Forcefully disconnecting 0 remaining clients
master2  | 2025-01-02T01:11:26.495661Z 0 [Note] Event Scheduler: Purging the queue. 0 events
master2  | 2025-01-02T01:11:26.495876Z 0 [Note] Binlog end
master3  | 2025-01-02T01:11:39.085594Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
master3  | 2025-01-02T01:11:39.085654Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
master3  | 2025-01-02T01:11:39.085663Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
master3  | 2025-01-02T01:11:39.085666Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
master3  | 2025-01-02T01:11:39.086392Z 0 [Warning] CA certificate ca.pem is self signed.
master3  | 2025-01-02T01:11:39.086481Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
master3  | 2025-01-02T01:11:39.097255Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/lib/mysql' in the path is accessible to all OS users. Consider choosing a different directory.
master3  | 2025-01-02T01:11:39.099630Z 0 [Note] Failed to start slave threads for channel ''
master3  | 2025-01-02T01:11:39.103657Z 0 [Note] Event Scheduler: Loaded 0 events
master2  | 2025-01-02T01:11:26.506148Z 0 [Note] Shutting down plugin 'group_replication'
master2  | 2025-01-02T01:11:26.506230Z 0 [Note] Plugin group_replication reported: 'All Group Replication server observers have been successfully unregistered'
master2  | 2025-01-02T01:11:26.506245Z 0 [Note] Shutting down plugin 'ngram'
master2  | 2025-01-02T01:11:26.506248Z 0 [Note] Shutting down plugin 'partition'
master2  | 2025-01-02T01:11:26.506251Z 0 [Note] Shutting down plugin 'BLACKHOLE'
master2  | 2025-01-02T01:11:26.506255Z 0 [Note] Shutting down plugin 'ARCHIVE'
master2  | 2025-01-02T01:11:26.506257Z 0 [Note] Shutting down plugin 'PERFORMANCE_SCHEMA'
master2  | 2025-01-02T01:11:26.506286Z 0 [Note] Shutting down plugin 'MRG_MYISAM'
master2  | 2025-01-02T01:11:26.506289Z 0 [Note] Shutting down plugin 'MyISAM'
master2  | 2025-01-02T01:11:26.506300Z 0 [Note] Shutting down plugin 'INNODB_SYS_VIRTUAL'
master2  | 2025-01-02T01:11:26.506303Z 0 [Note] Shutting down plugin 'INNODB_SYS_DATAFILES'
master2  | 2025-01-02T01:11:26.506306Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESPACES'
master2  | 2025-01-02T01:11:26.506308Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN_COLS'
master2  | 2025-01-02T01:11:26.506310Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN'
master2  | 2025-01-02T01:11:26.506312Z 0 [Note] Shutting down plugin 'INNODB_SYS_FIELDS'
slave    | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
master1  | 2025-01-02T01:11:04.128622Z 0 [Note] Shutting down slave threads
master1  | 2025-01-02T01:11:04.128630Z 0 [Note] Forcefully disconnecting 0 remaining clients
master1  | 2025-01-02T01:11:04.128643Z 0 [Note] Event Scheduler: Purging the queue. 0 events
master1  | 2025-01-02T01:11:04.128764Z 0 [Note] Binlog end
master1  | 2025-01-02T01:11:04.139889Z 0 [Note] Shutting down plugin 'group_replication'
master1  | 2025-01-02T01:11:04.139954Z 0 [Note] Plugin group_replication reported: 'All Group Replication server observers have been successfully unregistered'
master1  | 2025-01-02T01:11:04.139968Z 0 [Note] Shutting down plugin 'ngram'
master1  | 2025-01-02T01:11:04.139971Z 0 [Note] Shutting down plugin 'partition'
master1  | 2025-01-02T01:11:04.139973Z 0 [Note] Shutting down plugin 'BLACKHOLE'
master1  | 2025-01-02T01:11:04.139977Z 0 [Note] Shutting down plugin 'ARCHIVE'
master1  | 2025-01-02T01:11:04.139978Z 0 [Note] Shutting down plugin 'PERFORMANCE_SCHEMA'
slave    | 2025-01-02T01:11:59.225039Z 3 [Note] InnoDB: Stopping purge
slave    | 2025-01-02T01:11:59.246919Z 3 [Note] InnoDB: Resuming purge
master2  | 2025-01-02T01:11:26.506317Z 0 [Note] Shutting down plugin 'INNODB_SYS_COLUMNS'
master2  | 2025-01-02T01:11:26.506319Z 0 [Note] Shutting down plugin 'INNODB_SYS_INDEXES'
master2  | 2025-01-02T01:11:26.506321Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESTATS'
master2  | 2025-01-02T01:11:26.506323Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLES'
master2  | 2025-01-02T01:11:26.506325Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_TABLE'
master2  | 2025-01-02T01:11:26.506328Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_CACHE'
master2  | 2025-01-02T01:11:26.506330Z 0 [Note] Shutting down plugin 'INNODB_FT_CONFIG'
master2  | 2025-01-02T01:11:26.506332Z 0 [Note] Shutting down plugin 'INNODB_FT_BEING_DELETED'
master2  | 2025-01-02T01:11:26.506334Z 0 [Note] Shutting down plugin 'INNODB_FT_DELETED'
master2  | 2025-01-02T01:11:26.506336Z 0 [Note] Shutting down plugin 'INNODB_FT_DEFAULT_STOPWORD'
master3  | 2025-01-02T01:11:39.104034Z 0 [Note] mysqld: ready for connections.
master3  | Version: '5.7.44-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server (GPL)
master1  | 2025-01-02T01:11:04.140020Z 0 [Note] Shutting down plugin 'MRG_MYISAM'
master1  | 2025-01-02T01:11:04.140024Z 0 [Note] Shutting down plugin 'MyISAM'
master1  | 2025-01-02T01:11:04.140043Z 0 [Note] Shutting down plugin 'INNODB_SYS_VIRTUAL'
master1  | 2025-01-02T01:11:04.140049Z 0 [Note] Shutting down plugin 'INNODB_SYS_DATAFILES'
master1  | 2025-01-02T01:11:04.140052Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESPACES'
master1  | 2025-01-02T01:11:04.140054Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN_COLS'
master1  | 2025-01-02T01:11:04.140055Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN'
master1  | 2025-01-02T01:11:04.140057Z 0 [Note] Shutting down plugin 'INNODB_SYS_FIELDS'
master1  | 2025-01-02T01:11:04.140059Z 0 [Note] Shutting down plugin 'INNODB_SYS_COLUMNS'
slave    | 2025-01-02T01:11:59.282728Z 3 [Note] InnoDB: Stopping purge
slave    | 2025-01-02T01:11:59.305294Z 3 [Note] InnoDB: Resuming purge
slave    | 2025-01-02T01:11:59.339393Z 3 [Note] InnoDB: Stopping purge
slave    | 2025-01-02T01:11:59.363515Z 3 [Note] InnoDB: Resuming purge
slave    | 2025-01-02T01:11:59.398738Z 3 [Note] InnoDB: Stopping purge
slave    | 2025-01-02T01:11:59.421266Z 3 [Note] InnoDB: Resuming purge
slave    | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
slave    | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
slave    | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
slave    | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
slave    | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
slave    | 2025-01-02 04:12:02+03:00 [Note] [Entrypoint]: Creating user repl_user
slave    | 
slave    | 2025-01-02 04:12:02+03:00 [Note] [Entrypoint]: Stopping temporary server
slave    | 2025-01-02T01:12:02.162762Z 0 [Note] Giving 0 client threads a chance to die gracefully
slave    | 2025-01-02T01:12:02.162853Z 0 [Note] Shutting down slave threads
slave    | 2025-01-02T01:12:02.162863Z 0 [Note] Forcefully disconnecting 0 remaining clients
master2  | 2025-01-02T01:11:26.506339Z 0 [Note] Shutting down plugin 'INNODB_METRICS'
master2  | 2025-01-02T01:11:26.506341Z 0 [Note] Shutting down plugin 'INNODB_TEMP_TABLE_INFO'
master2  | 2025-01-02T01:11:26.506343Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_POOL_STATS'
master2  | 2025-01-02T01:11:26.506345Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE_LRU'
master2  | 2025-01-02T01:11:26.506347Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE'
master2  | 2025-01-02T01:11:26.506349Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX_RESET'
master2  | 2025-01-02T01:11:26.506354Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX'
master2  | 2025-01-02T01:11:26.506357Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM_RESET'
master2  | 2025-01-02T01:11:26.506361Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM'
master3  | 2025-01-02 04:11:39+03:00 [Note] [Entrypoint]: Temporary server started.
master3  | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
master3  | 2025-01-02T01:11:39.813956Z 3 [Note] InnoDB: Stopping purge
master3  | 2025-01-02T01:11:39.838787Z 3 [Note] InnoDB: Resuming purge
master3  | 2025-01-02T01:11:39.871639Z 3 [Note] InnoDB: Stopping purge
master3  | 2025-01-02T01:11:39.892637Z 3 [Note] InnoDB: Resuming purge
master3  | 2025-01-02T01:11:39.926334Z 3 [Note] InnoDB: Stopping purge
master3  | 2025-01-02T01:11:39.947780Z 3 [Note] InnoDB: Resuming purge
master3  | 2025-01-02T01:11:39.982143Z 3 [Note] InnoDB: Stopping purge
master1  | 2025-01-02T01:11:04.140061Z 0 [Note] Shutting down plugin 'INNODB_SYS_INDEXES'
master1  | 2025-01-02T01:11:04.140063Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESTATS'
master1  | 2025-01-02T01:11:04.140065Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLES'
master1  | 2025-01-02T01:11:04.140067Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_TABLE'
master1  | 2025-01-02T01:11:04.140069Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_CACHE'
master1  | 2025-01-02T01:11:04.140071Z 0 [Note] Shutting down plugin 'INNODB_FT_CONFIG'
master1  | 2025-01-02T01:11:04.140073Z 0 [Note] Shutting down plugin 'INNODB_FT_BEING_DELETED'
master1  | 2025-01-02T01:11:04.140075Z 0 [Note] Shutting down plugin 'INNODB_FT_DELETED'
master1  | 2025-01-02T01:11:04.140077Z 0 [Note] Shutting down plugin 'INNODB_FT_DEFAULT_STOPWORD'
master1  | 2025-01-02T01:11:04.140079Z 0 [Note] Shutting down plugin 'INNODB_METRICS'
master2  | 2025-01-02T01:11:26.506364Z 0 [Note] Shutting down plugin 'INNODB_CMP_RESET'
master2  | 2025-01-02T01:11:26.506368Z 0 [Note] Shutting down plugin 'INNODB_CMP'
master2  | 2025-01-02T01:11:26.506372Z 0 [Note] Shutting down plugin 'INNODB_LOCK_WAITS'
master2  | 2025-01-02T01:11:26.506376Z 0 [Note] Shutting down plugin 'INNODB_LOCKS'
master2  | 2025-01-02T01:11:26.506380Z 0 [Note] Shutting down plugin 'INNODB_TRX'
master2  | 2025-01-02T01:11:26.506384Z 0 [Note] Shutting down plugin 'InnoDB'
master1  | 2025-01-02T01:11:04.140081Z 0 [Note] Shutting down plugin 'INNODB_TEMP_TABLE_INFO'
master1  | 2025-01-02T01:11:04.140083Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_POOL_STATS'
master1  | 2025-01-02T01:11:04.140085Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE_LRU'
master1  | 2025-01-02T01:11:04.140087Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE'
master1  | 2025-01-02T01:11:04.140089Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX_RESET'
master1  | 2025-01-02T01:11:04.140091Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX'
master1  | 2025-01-02T01:11:04.140093Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM_RESET'
master1  | 2025-01-02T01:11:04.140095Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM'
master1  | 2025-01-02T01:11:04.140097Z 0 [Note] Shutting down plugin 'INNODB_CMP_RESET'
master1  | 2025-01-02T01:11:04.140099Z 0 [Note] Shutting down plugin 'INNODB_CMP'
master1  | 2025-01-02T01:11:04.140101Z 0 [Note] Shutting down plugin 'INNODB_LOCK_WAITS'
master1  | 2025-01-02T01:11:04.140103Z 0 [Note] Shutting down plugin 'INNODB_LOCKS'
master1  | 2025-01-02T01:11:04.140105Z 0 [Note] Shutting down plugin 'INNODB_TRX'
master2  | 2025-01-02T01:11:26.506663Z 0 [Note] InnoDB: FTS optimize thread exiting.
master2  | 2025-01-02T01:11:26.507106Z 0 [Note] InnoDB: Starting shutdown...
master2  | 2025-01-02T01:11:26.607610Z 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
slave    | 2025-01-02T01:12:02.162871Z 0 [Note] Event Scheduler: Purging the queue. 0 events
slave    | 2025-01-02T01:12:02.163027Z 0 [Note] Binlog end
slave    | 2025-01-02T01:12:02.173915Z 0 [Note] Shutting down plugin 'ngram'
slave    | 2025-01-02T01:12:02.174001Z 0 [Note] Shutting down plugin 'partition'
slave    | 2025-01-02T01:12:02.174009Z 0 [Note] Shutting down plugin 'BLACKHOLE'
slave    | 2025-01-02T01:12:02.174013Z 0 [Note] Shutting down plugin 'ARCHIVE'
slave    | 2025-01-02T01:12:02.174017Z 0 [Note] Shutting down plugin 'PERFORMANCE_SCHEMA'
slave    | 2025-01-02T01:12:02.174056Z 0 [Note] Shutting down plugin 'MRG_MYISAM'
slave    | 2025-01-02T01:12:02.174061Z 0 [Note] Shutting down plugin 'MyISAM'
slave    | 2025-01-02T01:12:02.174072Z 0 [Note] Shutting down plugin 'INNODB_SYS_VIRTUAL'
slave    | 2025-01-02T01:12:02.174077Z 0 [Note] Shutting down plugin 'INNODB_SYS_DATAFILES'
slave    | 2025-01-02T01:12:02.174080Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESPACES'
master1  | 2025-01-02T01:11:04.140107Z 0 [Note] Shutting down plugin 'InnoDB'
master1  | 2025-01-02T01:11:04.140271Z 0 [Note] InnoDB: FTS optimize thread exiting.
master3  | 2025-01-02T01:11:40.003735Z 3 [Note] InnoDB: Resuming purge
master1  | 2025-01-02T01:11:04.140456Z 0 [Note] InnoDB: Starting shutdown...
master1  | 2025-01-02T01:11:04.240943Z 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
master1  | 2025-01-02T01:11:04.241553Z 0 [Note] InnoDB: Buffer pool(s) dump completed at 250102  4:11:04
master3  | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
master3  | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
master3  | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
master3  | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
master3  | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
slave    | 2025-01-02T01:12:02.174083Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN_COLS'
slave    | 2025-01-02T01:12:02.174086Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN'
slave    | 2025-01-02T01:12:02.174089Z 0 [Note] Shutting down plugin 'INNODB_SYS_FIELDS'
master1  | 2025-01-02T01:11:05.992829Z 0 [Note] InnoDB: Shutdown completed; log sequence number 12219930
master1  | 2025-01-02T01:11:05.995876Z 0 [Note] InnoDB: Removed temporary tablespace data file: "ibtmp1"
master3  | 2025-01-02 04:11:42+03:00 [Note] [Entrypoint]: Creating user repl_user
master1  | 2025-01-02T01:11:05.995949Z 0 [Note] Shutting down plugin 'MEMORY'
master3  | 
slave    | 2025-01-02T01:12:02.174092Z 0 [Note] Shutting down plugin 'INNODB_SYS_COLUMNS'
slave    | 2025-01-02T01:12:02.174095Z 0 [Note] Shutting down plugin 'INNODB_SYS_INDEXES'
slave    | 2025-01-02T01:12:02.174098Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESTATS'
slave    | 2025-01-02T01:12:02.174101Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLES'
slave    | 2025-01-02T01:12:02.174104Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_TABLE'
slave    | 2025-01-02T01:12:02.174106Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_CACHE'
slave    | 2025-01-02T01:12:02.174109Z 0 [Note] Shutting down plugin 'INNODB_FT_CONFIG'
master1  | 2025-01-02T01:11:05.995958Z 0 [Note] Shutting down plugin 'CSV'
master3  | 2025-01-02 04:11:42+03:00 [Note] [Entrypoint]: Stopping temporary server
master3  | 2025-01-02T01:11:42.909511Z 0 [Note] Giving 0 client threads a chance to die gracefully
master3  | 2025-01-02T01:11:42.909561Z 0 [Note] Shutting down slave threads
master1  | 2025-01-02T01:11:05.995963Z 0 [Note] Shutting down plugin 'sha256_password'
master1  | 2025-01-02T01:11:05.995966Z 0 [Note] Shutting down plugin 'mysql_native_password'
master1  | 2025-01-02T01:11:05.996410Z 0 [Note] Shutting down plugin 'binlog'
master1  | 2025-01-02T01:11:05.997607Z 0 [Note] mysqld: Shutdown complete
master1  | 
master3  | 2025-01-02T01:11:42.909566Z 0 [Note] Forcefully disconnecting 0 remaining clients
master1  | 2025-01-02 04:11:06+03:00 [Note] [Entrypoint]: Temporary server stopped
master1  | 
master1  | 2025-01-02 04:11:06+03:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
master3  | 2025-01-02T01:11:42.909574Z 0 [Note] Event Scheduler: Purging the queue. 0 events
master1  | 
master1  | 2025-01-02T01:11:06.297458Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
master3  | 2025-01-02T01:11:42.909663Z 0 [Note] Binlog end
master3  | 2025-01-02T01:11:42.919879Z 0 [Note] Shutting down plugin 'group_replication'
master3  | 2025-01-02T01:11:42.919945Z 0 [Note] Plugin group_replication reported: 'All Group Replication server observers have been successfully unregistered'
master3  | 2025-01-02T01:11:42.919960Z 0 [Note] Shutting down plugin 'ngram'
master3  | 2025-01-02T01:11:42.919963Z 0 [Note] Shutting down plugin 'partition'
master3  | 2025-01-02T01:11:42.919966Z 0 [Note] Shutting down plugin 'BLACKHOLE'
master3  | 2025-01-02T01:11:42.919969Z 0 [Note] Shutting down plugin 'ARCHIVE'
master3  | 2025-01-02T01:11:42.919971Z 0 [Note] Shutting down plugin 'PERFORMANCE_SCHEMA'
master3  | 2025-01-02T01:11:42.920000Z 0 [Note] Shutting down plugin 'MRG_MYISAM'
slave    | 2025-01-02T01:12:02.174112Z 0 [Note] Shutting down plugin 'INNODB_FT_BEING_DELETED'
slave    | 2025-01-02T01:12:02.174115Z 0 [Note] Shutting down plugin 'INNODB_FT_DELETED'
slave    | 2025-01-02T01:12:02.174118Z 0 [Note] Shutting down plugin 'INNODB_FT_DEFAULT_STOPWORD'
slave    | 2025-01-02T01:12:02.174121Z 0 [Note] Shutting down plugin 'INNODB_METRICS'
slave    | 2025-01-02T01:12:02.174124Z 0 [Note] Shutting down plugin 'INNODB_TEMP_TABLE_INFO'
slave    | 2025-01-02T01:12:02.174127Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_POOL_STATS'
slave    | 2025-01-02T01:12:02.174130Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE_LRU'
slave    | 2025-01-02T01:12:02.174133Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE'
slave    | 2025-01-02T01:12:02.174136Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX_RESET'
slave    | 2025-01-02T01:12:02.174138Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX'
slave    | 2025-01-02T01:12:02.174141Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM_RESET'
slave    | 2025-01-02T01:12:02.174145Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM'
slave    | 2025-01-02T01:12:02.174148Z 0 [Note] Shutting down plugin 'INNODB_CMP_RESET'
slave    | 2025-01-02T01:12:02.174150Z 0 [Note] Shutting down plugin 'INNODB_CMP'
slave    | 2025-01-02T01:12:02.174153Z 0 [Note] Shutting down plugin 'INNODB_LOCK_WAITS'
slave    | 2025-01-02T01:12:02.174156Z 0 [Note] Shutting down plugin 'INNODB_LOCKS'
slave    | 2025-01-02T01:12:02.174158Z 0 [Note] Shutting down plugin 'INNODB_TRX'
slave    | 2025-01-02T01:12:02.174161Z 0 [Note] Shutting down plugin 'InnoDB'
slave    | 2025-01-02T01:12:02.174312Z 0 [Note] InnoDB: FTS optimize thread exiting.
slave    | 2025-01-02T01:12:02.174632Z 0 [Note] InnoDB: Starting shutdown...
slave    | 2025-01-02T01:12:02.275198Z 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
slave    | 2025-01-02T01:12:02.275768Z 0 [Note] InnoDB: Buffer pool(s) dump completed at 250102  4:12:02
slave    | 2025-01-02T01:12:03.542554Z 0 [Note] InnoDB: Shutdown completed; log sequence number 12220355
slave    | 2025-01-02T01:12:03.544118Z 0 [Note] InnoDB: Removed temporary tablespace data file: "ibtmp1"
slave    | 2025-01-02T01:12:03.544167Z 0 [Note] Shutting down plugin 'MEMORY'
slave    | 2025-01-02T01:12:03.544173Z 0 [Note] Shutting down plugin 'CSV'
slave    | 2025-01-02T01:12:03.544177Z 0 [Note] Shutting down plugin 'sha256_password'
slave    | 2025-01-02T01:12:03.544179Z 0 [Note] Shutting down plugin 'mysql_native_password'
slave    | 2025-01-02T01:12:03.544321Z 0 [Note] Shutting down plugin 'binlog'
slave    | 2025-01-02T01:12:03.545135Z 0 [Note] mysqld: Shutdown complete
slave    | 
slave    | 2025-01-02 04:12:04+03:00 [Note] [Entrypoint]: Temporary server stopped
slave    | 
slave    | 2025-01-02 04:12:04+03:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
slave    | 
slave    | 2025-01-02T01:12:04.325327Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
slave    | 2025-01-02T01:12:04.326773Z 0 [Note] mysqld (mysqld 5.7.44-log) starting as process 1 ...
slave    | 2025-01-02T01:12:04.334598Z 0 [Note] InnoDB: PUNCH HOLE support available
slave    | 2025-01-02T01:12:04.334635Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
slave    | 2025-01-02T01:12:04.334640Z 0 [Note] InnoDB: Uses event mutexes
slave    | 2025-01-02T01:12:04.334642Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
slave    | 2025-01-02T01:12:04.334645Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
slave    | 2025-01-02T01:12:04.334648Z 0 [Note] InnoDB: Using Linux native AIO
slave    | 2025-01-02T01:12:04.334842Z 0 [Note] InnoDB: Number of pools: 1
slave    | 2025-01-02T01:12:04.334944Z 0 [Note] InnoDB: Using CPU crc32 instructions
slave    | 2025-01-02T01:12:04.336051Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
slave    | 2025-01-02T01:12:04.343159Z 0 [Note] InnoDB: Completed initialization of buffer pool
slave    | 2025-01-02T01:12:04.344998Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
master3  | 2025-01-02T01:11:42.920005Z 0 [Note] Shutting down plugin 'MyISAM'
master3  | 2025-01-02T01:11:42.920017Z 0 [Note] Shutting down plugin 'INNODB_SYS_VIRTUAL'
master3  | 2025-01-02T01:11:42.920020Z 0 [Note] Shutting down plugin 'INNODB_SYS_DATAFILES'
master3  | 2025-01-02T01:11:42.920023Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESPACES'
master3  | 2025-01-02T01:11:42.920026Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN_COLS'
master3  | 2025-01-02T01:11:42.920028Z 0 [Note] Shutting down plugin 'INNODB_SYS_FOREIGN'
master3  | 2025-01-02T01:11:42.920031Z 0 [Note] Shutting down plugin 'INNODB_SYS_FIELDS'
master3  | 2025-01-02T01:11:42.920034Z 0 [Note] Shutting down plugin 'INNODB_SYS_COLUMNS'
master3  | 2025-01-02T01:11:42.920037Z 0 [Note] Shutting down plugin 'INNODB_SYS_INDEXES'
master3  | 2025-01-02T01:11:42.920040Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLESTATS'
slave    | 2025-01-02T01:12:04.356329Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
slave    | 2025-01-02T01:12:04.371815Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
slave    | 2025-01-02T01:12:04.371883Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
slave    | 2025-01-02T01:12:04.390285Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
slave    | 2025-01-02T01:12:04.390889Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
slave    | 2025-01-02T01:12:04.390929Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
slave    | 2025-01-02T01:12:04.391986Z 0 [Note] InnoDB: 5.7.44 started; log sequence number 12220355
slave    | 2025-01-02T01:12:04.392145Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
slave    | 2025-01-02T01:12:04.392527Z 0 [Note] Plugin 'FEDERATED' is disabled.
slave    | 2025-01-02T01:12:04.394991Z 0 [Note] InnoDB: Buffer pool(s) load completed at 250102  4:12:04
slave    | 2025-01-02T01:12:04.463349Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
slave    | 2025-01-02T01:12:04.463414Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
slave    | 2025-01-02T01:12:04.463426Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
slave    | 2025-01-02T01:12:04.463431Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
slave    | 2025-01-02T01:12:04.464768Z 0 [Warning] CA certificate ca.pem is self signed.
slave    | 2025-01-02T01:12:04.464872Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
slave    | 2025-01-02T01:12:04.465048Z 0 [Note] Server hostname (bind-address): '0.0.0.0'; port: 3306
master3  | 2025-01-02T01:11:42.920043Z 0 [Note] Shutting down plugin 'INNODB_SYS_TABLES'
master3  | 2025-01-02T01:11:42.920047Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_TABLE'
master3  | 2025-01-02T01:11:42.920050Z 0 [Note] Shutting down plugin 'INNODB_FT_INDEX_CACHE'
master3  | 2025-01-02T01:11:42.920054Z 0 [Note] Shutting down plugin 'INNODB_FT_CONFIG'
master3  | 2025-01-02T01:11:42.920057Z 0 [Note] Shutting down plugin 'INNODB_FT_BEING_DELETED'
master3  | 2025-01-02T01:11:42.920059Z 0 [Note] Shutting down plugin 'INNODB_FT_DELETED'
master3  | 2025-01-02T01:11:42.920061Z 0 [Note] Shutting down plugin 'INNODB_FT_DEFAULT_STOPWORD'
master3  | 2025-01-02T01:11:42.920063Z 0 [Note] Shutting down plugin 'INNODB_METRICS'
master3  | 2025-01-02T01:11:42.920065Z 0 [Note] Shutting down plugin 'INNODB_TEMP_TABLE_INFO'
master3  | 2025-01-02T01:11:42.920067Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_POOL_STATS'
master3  | 2025-01-02T01:11:42.920070Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE_LRU'
master3  | 2025-01-02T01:11:42.920072Z 0 [Note] Shutting down plugin 'INNODB_BUFFER_PAGE'
master3  | 2025-01-02T01:11:42.920074Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX_RESET'
master3  | 2025-01-02T01:11:42.920076Z 0 [Note] Shutting down plugin 'INNODB_CMP_PER_INDEX'
master3  | 2025-01-02T01:11:42.920078Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM_RESET'
master3  | 2025-01-02T01:11:42.920081Z 0 [Note] Shutting down plugin 'INNODB_CMPMEM'
master3  | 2025-01-02T01:11:42.920084Z 0 [Note] Shutting down plugin 'INNODB_CMP_RESET'
master3  | 2025-01-02T01:11:42.920087Z 0 [Note] Shutting down plugin 'INNODB_CMP'
master3  | 2025-01-02T01:11:42.920090Z 0 [Note] Shutting down plugin 'INNODB_LOCK_WAITS'
master3  | 2025-01-02T01:11:42.920094Z 0 [Note] Shutting down plugin 'INNODB_LOCKS'
master3  | 2025-01-02T01:11:42.920097Z 0 [Note] Shutting down plugin 'INNODB_TRX'
master3  | 2025-01-02T01:11:42.920100Z 0 [Note] Shutting down plugin 'InnoDB'
master3  | 2025-01-02T01:11:42.920209Z 0 [Note] InnoDB: FTS optimize thread exiting.
master3  | 2025-01-02T01:11:42.920492Z 0 [Note] InnoDB: Starting shutdown...
master3  | 2025-01-02T01:11:43.020858Z 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
master3  | 2025-01-02T01:11:43.028654Z 0 [Note] InnoDB: Buffer pool(s) dump completed at 250102  4:11:43
master3  | 2025-01-02T01:11:47.000034Z 0 [Note] InnoDB: Shutdown completed; log sequence number 12219930
master3  | 2025-01-02T01:11:47.003493Z 0 [Note] InnoDB: Removed temporary tablespace data file: "ibtmp1"
master3  | 2025-01-02T01:11:47.003572Z 0 [Note] Shutting down plugin 'MEMORY'
master3  | 2025-01-02T01:11:47.003583Z 0 [Note] Shutting down plugin 'CSV'
master3  | 2025-01-02T01:11:47.003590Z 0 [Note] Shutting down plugin 'sha256_password'
master3  | 2025-01-02T01:11:47.003594Z 0 [Note] Shutting down plugin 'mysql_native_password'
master3  | 2025-01-02T01:11:47.003986Z 0 [Note] Shutting down plugin 'binlog'
master3  | 2025-01-02T01:11:47.005359Z 0 [Note] mysqld: Shutdown complete
master3  | 
master3  | 2025-01-02 04:11:47+03:00 [Note] [Entrypoint]: Temporary server stopped
master3  | 
master3  | 2025-01-02 04:11:47+03:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
master3  | 
slave    | 2025-01-02T01:12:04.465093Z 0 [Note]   - '0.0.0.0' resolves to '0.0.0.0';
slave    | 2025-01-02T01:12:04.465188Z 0 [Note] Server socket created on IP: '0.0.0.0'.
slave    | 2025-01-02T01:12:04.476971Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/lib/mysql' in the path is accessible to all OS users. Consider choosing a different directory.
slave    | 2025-01-02T01:12:04.482857Z 0 [Note] Failed to start slave threads for channel ''
slave    | 2025-01-02T01:12:04.489782Z 0 [Note] Event Scheduler: Loaded 0 events
slave    | 2025-01-02T01:12:04.490581Z 0 [Note] mysqld: ready for connections.
slave    | Version: '5.7.44-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
master2  | 2025-01-02T01:11:26.630482Z 0 [Note] InnoDB: Buffer pool(s) dump completed at 250102  4:11:26
master2  | 2025-01-02T01:11:27.764078Z 0 [Note] InnoDB: Shutdown completed; log sequence number 12220780
master2  | 2025-01-02T01:11:27.766871Z 0 [Note] InnoDB: Removed temporary tablespace data file: "ibtmp1"
master2  | 2025-01-02T01:11:27.766976Z 0 [Note] Shutting down plugin 'MEMORY'
master2  | 2025-01-02T01:11:27.766984Z 0 [Note] Shutting down plugin 'CSV'
master2  | 2025-01-02T01:11:27.766989Z 0 [Note] Shutting down plugin 'sha256_password'
master2  | 2025-01-02T01:11:27.766992Z 0 [Note] Shutting down plugin 'mysql_native_password'
master2  | 2025-01-02T01:11:27.767419Z 0 [Note] Shutting down plugin 'binlog'
master2  | 2025-01-02T01:11:27.768516Z 0 [Note] mysqld: Shutdown complete
master2  | 
master2  | 2025-01-02 04:11:28+03:00 [Note] [Entrypoint]: Temporary server stopped
master2  | 
master2  | 2025-01-02 04:11:28+03:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
master2  | 
master2  | 2025-01-02T01:11:28.645004Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
master2  | 2025-01-02T01:11:28.645741Z 0 [Note] mysqld (mysqld 5.7.44-log) starting as process 1 ...
master2  | 2025-01-02T01:11:28.651772Z 0 [Note] InnoDB: PUNCH HOLE support available
master2  | 2025-01-02T01:11:28.651812Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
master2  | 2025-01-02T01:11:28.651815Z 0 [Note] InnoDB: Uses event mutexes
master2  | 2025-01-02T01:11:28.651817Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
master2  | 2025-01-02T01:11:28.651819Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
master2  | 2025-01-02T01:11:28.651821Z 0 [Note] InnoDB: Using Linux native AIO
master3  | 2025-01-02T01:11:47.991999Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
master3  | 2025-01-02T01:11:47.994964Z 0 [Note] mysqld (mysqld 5.7.44-log) starting as process 1 ...
master3  | 2025-01-02T01:11:48.000645Z 0 [Note] InnoDB: PUNCH HOLE support available
master3  | 2025-01-02T01:11:48.000684Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
master3  | 2025-01-02T01:11:48.000689Z 0 [Note] InnoDB: Uses event mutexes
master3  | 2025-01-02T01:11:48.000692Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
master3  | 2025-01-02T01:11:48.000694Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
master3  | 2025-01-02T01:11:48.000697Z 0 [Note] InnoDB: Using Linux native AIO
master3  | 2025-01-02T01:11:48.000890Z 0 [Note] InnoDB: Number of pools: 1
master3  | 2025-01-02T01:11:48.000987Z 0 [Note] InnoDB: Using CPU crc32 instructions
master3  | 2025-01-02T01:11:48.002175Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
master3  | 2025-01-02T01:11:48.009367Z 0 [Note] InnoDB: Completed initialization of buffer pool
master2  | 2025-01-02T01:11:28.652145Z 0 [Note] InnoDB: Number of pools: 1
master2  | 2025-01-02T01:11:28.652292Z 0 [Note] InnoDB: Using CPU crc32 instructions
master2  | 2025-01-02T01:11:28.653337Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
master2  | 2025-01-02T01:11:28.659116Z 0 [Note] InnoDB: Completed initialization of buffer pool
master2  | 2025-01-02T01:11:28.661019Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
master2  | 2025-01-02T01:11:28.672002Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
master2  | 2025-01-02T01:11:28.685717Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
master2  | 2025-01-02T01:11:28.685800Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
master2  | 2025-01-02T01:11:28.707025Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
master2  | 2025-01-02T01:11:28.707687Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
master2  | 2025-01-02T01:11:28.707721Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
master2  | 2025-01-02T01:11:28.708644Z 0 [Note] InnoDB: 5.7.44 started; log sequence number 12220780
master2  | 2025-01-02T01:11:28.708829Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
master2  | 2025-01-02T01:11:28.709248Z 0 [Note] Plugin 'FEDERATED' is disabled.
master2  | 2025-01-02T01:11:28.710861Z 0 [Note] InnoDB: Buffer pool(s) load completed at 250102  4:11:28
master1  | 2025-01-02T01:11:06.298980Z 0 [Note] mysqld (mysqld 5.7.44-log) starting as process 1 ...
master1  | 2025-01-02T01:11:06.304187Z 0 [Note] InnoDB: PUNCH HOLE support available
master1  | 2025-01-02T01:11:06.304242Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
master1  | 2025-01-02T01:11:06.304248Z 0 [Note] InnoDB: Uses event mutexes
master1  | 2025-01-02T01:11:06.304250Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
master1  | 2025-01-02T01:11:06.304253Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.13
master1  | 2025-01-02T01:11:06.304255Z 0 [Note] InnoDB: Using Linux native AIO
master1  | 2025-01-02T01:11:06.304483Z 0 [Note] InnoDB: Number of pools: 1
master1  | 2025-01-02T01:11:06.304725Z 0 [Note] InnoDB: Using CPU crc32 instructions
master2  | 2025-01-02T01:11:28.763231Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
master2  | 2025-01-02T01:11:28.763280Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
master2  | 2025-01-02T01:11:28.763287Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
master2  | 2025-01-02T01:11:28.763289Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
master2  | 2025-01-02T01:11:28.763819Z 0 [Warning] CA certificate ca.pem is self signed.
master2  | 2025-01-02T01:11:28.763877Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
master2  | 2025-01-02T01:11:28.763970Z 0 [Note] Server hostname (bind-address): '0.0.0.0'; port: 3306
master2  | 2025-01-02T01:11:28.764009Z 0 [Note]   - '0.0.0.0' resolves to '0.0.0.0';
master2  | 2025-01-02T01:11:28.764044Z 0 [Note] Server socket created on IP: '0.0.0.0'.
master2  | 2025-01-02T01:11:28.773145Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/lib/mysql' in the path is accessible to all OS users. Consider choosing a different directory.
master2  | 2025-01-02T01:11:28.776244Z 0 [Note] Failed to start slave threads for channel ''
master2  | 2025-01-02T01:11:28.780026Z 0 [Note] Event Scheduler: Loaded 0 events
master2  | 2025-01-02T01:11:28.780358Z 0 [Note] mysqld: ready for connections.
master2  | Version: '5.7.44-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
master1  | 2025-01-02T01:11:06.306069Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
master3  | 2025-01-02T01:11:48.012152Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
master3  | 2025-01-02T01:11:48.023879Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
master3  | 2025-01-02T01:11:48.039514Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
master3  | 2025-01-02T01:11:48.039620Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
master3  | 2025-01-02T01:11:48.057888Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
master3  | 2025-01-02T01:11:48.058502Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
master3  | 2025-01-02T01:11:48.058532Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
master3  | 2025-01-02T01:11:48.059262Z 0 [Note] InnoDB: 5.7.44 started; log sequence number 12219930
master3  | 2025-01-02T01:11:48.059393Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
master3  | 2025-01-02T01:11:48.059973Z 0 [Note] Plugin 'FEDERATED' is disabled.
master3  | 2025-01-02T01:11:48.061807Z 0 [Note] InnoDB: Buffer pool(s) load completed at 250102  4:11:48
master3  | 2025-01-02T01:11:48.120452Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
master3  | 2025-01-02T01:11:48.120496Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
master3  | 2025-01-02T01:11:48.120502Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
master3  | 2025-01-02T01:11:48.120504Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
master3  | 2025-01-02T01:11:48.121157Z 0 [Warning] CA certificate ca.pem is self signed.
master3  | 2025-01-02T01:11:48.121217Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
master3  | 2025-01-02T01:11:48.121305Z 0 [Note] Server hostname (bind-address): '0.0.0.0'; port: 3306
master3  | 2025-01-02T01:11:48.121325Z 0 [Note]   - '0.0.0.0' resolves to '0.0.0.0';
master3  | 2025-01-02T01:11:48.121360Z 0 [Note] Server socket created on IP: '0.0.0.0'.
master3  | 2025-01-02T01:11:48.131028Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/lib/mysql' in the path is accessible to all OS users. Consider choosing a different directory.
master3  | 2025-01-02T01:11:48.136495Z 0 [Note] Failed to start slave threads for channel ''
master3  | 2025-01-02T01:11:48.141163Z 0 [Note] Event Scheduler: Loaded 0 events
master3  | 2025-01-02T01:11:48.141654Z 0 [Note] mysqld: ready for connections.
master3  | Version: '5.7.44-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
master1  | 2025-01-02T01:11:06.313225Z 0 [Note] InnoDB: Completed initialization of buffer pool
master1  | 2025-01-02T01:11:06.315779Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
master1  | 2025-01-02T01:11:06.327797Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
master1  | 2025-01-02T01:11:06.347753Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
master1  | 2025-01-02T01:11:06.347888Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
master1  | 2025-01-02T01:11:06.372972Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
master1  | 2025-01-02T01:11:06.373795Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
master1  | 2025-01-02T01:11:06.373834Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
master1  | 2025-01-02T01:11:06.374862Z 0 [Note] InnoDB: 5.7.44 started; log sequence number 12219930
master1  | 2025-01-02T01:11:06.375287Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
master1  | 2025-01-02T01:11:06.375709Z 0 [Note] Plugin 'FEDERATED' is disabled.
master1  | 2025-01-02T01:11:06.378275Z 0 [Note] InnoDB: Buffer pool(s) load completed at 250102  4:11:06
master1  | 2025-01-02T01:11:06.443852Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
master1  | 2025-01-02T01:11:06.443922Z 0 [Note] Skipping generation of SSL certificates as certificate files are present in data directory.
master1  | 2025-01-02T01:11:06.443936Z 0 [Warning] A deprecated TLS version TLSv1 is enabled. Please use TLSv1.2 or higher.
master1  | 2025-01-02T01:11:06.443939Z 0 [Warning] A deprecated TLS version TLSv1.1 is enabled. Please use TLSv1.2 or higher.
master1  | 2025-01-02T01:11:06.444863Z 0 [Warning] CA certificate ca.pem is self signed.
master1  | 2025-01-02T01:11:06.444968Z 0 [Note] Skipping generation of RSA key pair as key files are present in data directory.
master1  | 2025-01-02T01:11:06.445124Z 0 [Note] Server hostname (bind-address): '0.0.0.0'; port: 3306
master1  | 2025-01-02T01:11:06.445186Z 0 [Note]   - '0.0.0.0' resolves to '0.0.0.0';
master1  | 2025-01-02T01:11:06.445229Z 0 [Note] Server socket created on IP: '0.0.0.0'.
master1  | 2025-01-02T01:11:06.455107Z 0 [Warning] Insecure configuration for --pid-file: Location '/var/lib/mysql' in the path is accessible to all OS users. Consider choosing a different directory.
master1  | 2025-01-02T01:11:06.460105Z 0 [Note] Failed to start slave threads for channel ''
master1  | 2025-01-02T01:11:06.463421Z 0 [Note] Event Scheduler: Loaded 0 events
master1  | 2025-01-02T01:11:06.463920Z 0 [Note] mysqld: ready for connections.
master1  | Version: '5.7.44-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
master1  | 2025-01-02T01:15:10.781646Z 26 [Warning] Following users were specified in CREATE USER IF NOT EXISTS but they already exist. Corresponding entry in binary log used default authentication plugin 'mysql_native_password' to rewrite authentication information(if any) for them: 'repl_user'@'%'
master1  | 
master1  | 2025-01-02T01:15:10.796122Z 26 [Warning] Neither --relay-log nor --relay-log-index were used; so replication may break when this MySQL server acts as a slave and has his hostname changed!! Please use '--relay-log=master1-relay-bin' to avoid this problem.
master1  | 2025-01-02T01:15:10.846695Z 26 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_recovery' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''.
master1  | 2025-01-02T01:15:10.908722Z 26 [Note] Plugin group_replication reported: 'Group communication SSL configuration: group_replication_ssl_mode: "DISABLED"'
master1  | 2025-01-02T01:15:10.909523Z 26 [Note] Plugin group_replication reported: '[GCS] Translated 'master1' to 172.19.0.2'
master1  | 2025-01-02T01:15:10.910011Z 26 [Warning] Plugin group_replication reported: '[GCS] Automatically adding IPv4 localhost address to the whitelist. It is mandatory that it is added.'
master1  | 2025-01-02T01:15:10.910090Z 26 [Note] Plugin group_replication reported: '[GCS] SSL was not enabled'
master1  | 2025-01-02T01:15:10.910115Z 26 [Note] Plugin group_replication reported: 'Initialized group communication with configuration: group_replication_group_name: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"; group_replication_local_address: "master1:24901"; group_replication_group_seeds: "master1:24901,master2:24902,master3:24903"; group_replication_bootstrap_group: true; group_replication_poll_spin_loops: 0; group_replication_compression_threshold: 1000000; group_replication_ip_whitelist: "0.0.0.0/0"'
master1  | 2025-01-02T01:15:10.910129Z 26 [Note] Plugin group_replication reported: '[GCS] Configured number of attempts to join: 0'
master1  | 2025-01-02T01:15:10.910131Z 26 [Note] Plugin group_replication reported: '[GCS] Configured time between attempts to join: 5 seconds'
master1  | 2025-01-02T01:15:10.910139Z 26 [Note] Plugin group_replication reported: 'Member configuration: member_id: 1; member_uuid: "6948759d-c8a6-11ef-913b-0242ac130002"; single-primary mode: "false"; group_replication_auto_increment_increment: 7; '
master1  | 2025-01-02T01:15:10.910271Z 28 [Note] Plugin group_replication reported: 'Detected previous RESET MASTER invocation or an issue exists in the group replication applier relay log. Purging existing applier logs.'
master1  | 2025-01-02T01:15:10.979003Z 28 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_applier' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='<NULL>', master_port= 0, master_log_file='', master_log_pos= 4, master_bind=''.
master1  | 2025-01-02T01:15:11.096686Z 31 [Note] Slave SQL thread for channel 'group_replication_applier' initialized, starting replication in log 'FIRST' at position 0, relay log './master1-relay-bin-group_replication_applier.000001' position: 4
master1  | 2025-01-02T01:15:11.096787Z 26 [Note] Plugin group_replication reported: 'Group Replication applier module successfully initialized!'
master1  | 2025-01-02T01:15:11.096812Z 26 [Note] Plugin group_replication reported: 'auto_increment_increment is set to 7'
master1  | 2025-01-02T01:15:11.096816Z 26 [Note] Plugin group_replication reported: 'auto_increment_offset is set to 1'
master1  | 2025-01-02T01:15:11.111508Z 0 [Note] Plugin group_replication reported: 'XCom protocol version: 3'
master1  | 2025-01-02T01:15:11.111533Z 0 [Note] Plugin group_replication reported: 'XCom initialized and ready to accept incoming connections on port 24901'
master1  | 2025-01-02T01:15:12.116408Z 34 [Note] Plugin group_replication reported: 'Only one server alive. Declaring this server as online within the replication group'
master1  | 2025-01-02T01:15:12.116458Z 0 [Note] Plugin group_replication reported: 'Group membership changed to master1:3306 on view 17357805121158071:1.'
master1  | 2025-01-02T01:15:12.127610Z 0 [Note] Plugin group_replication reported: 'This server was declared online within the replication group'
setup    | Checking group replication status...
setup    | + check_replication
setup    | + echo 'Checking group replication status...'
setup    | + mysql --defaults-file=/tmp/master1.cnf -e '
setup    |         SELECT *
setup    |         FROM performance_schema.replication_group_members
setup    |         WHERE MEMBER_STATE='\''ONLINE'\'';'
setup    | CHANNEL_NAME MEMBER_ID       MEMBER_HOST     MEMBER_PORT     MEMBER_STATE
setup    | group_replication_applier    6948759d-c8a6-11ef-913b-0242ac130002    master1 3306    ONLINE
setup    | + '[' 0 -ne 0 ']'
setup    | + echo 'Master initialized!'
setup    | + sleep 30
setup    | Master initialized!
setup    | + check_replication
setup    | + echo 'Checking group replication status...'
setup    | + mysql --defaults-file=/tmp/master1.cnf -e '
setup    |         SELECT *
setup    |         FROM performance_schema.replication_group_members
setup    |         WHERE MEMBER_STATE='\''ONLINE'\'';'
setup    | Checking group replication status...
setup    | CHANNEL_NAME MEMBER_ID       MEMBER_HOST     MEMBER_PORT     MEMBER_STATE
setup    | group_replication_applier    6948759d-c8a6-11ef-913b-0242ac130002    master1 3306    ONLINE
setup    | + '[' 0 -ne 0 ']'
setup    | + echo 'Master initialized!'
setup    | Master initialized!
setup    | Initializing other master...
setup    | + for i in 2 3
setup    | + initialize_other_master /tmp/master2.cnf
setup    | + local cnf_file=/tmp/master2.cnf
setup    | + echo 'Initializing other master...'
setup    | + mysql --defaults-file=/tmp/master2.cnf -e '
setup    |         STOP GROUP_REPLICATION;
setup    |         RESET MASTER;
setup    |         SET GLOBAL super_read_only=0;
setup    |         SET GLOBAL read_only=0;
setup    |         SET SQL_LOG_BIN=0;
setup    | 
setup    |         CREATE USER IF NOT EXISTS '\''repl_user'\''@'\''%'\'' IDENTIFIED BY '\''repl_pass123'\'';
setup    |         GRANT REPLICATION SLAVE ON *.* TO '\''repl_user'\''@'\''%'\'';
setup    |         GRANT REPLICATION CLIENT ON *.* TO '\''repl_user'\''@'\''%'\'';
setup    |         GRANT SELECT ON performance_schema.* TO '\''repl_user'\''@'\''%'\'';
setup    |         GRANT SUPER ON *.* TO '\''repl_user'\''@'\''%'\'';
setup    | 
setup    |         # ProxySQL monitor user'\''ı ekle
setup    |         CREATE USER IF NOT EXISTS '\''monitor'\''@'\''%'\'' IDENTIFIED BY '\''monitor'\'';
setup    |         GRANT REPLICATION CLIENT ON *.* TO '\''monitor'\''@'\''%'\'';
setup    |         GRANT SELECT ON *.* TO '\''monitor'\''@'\''%'\'';
setup    |         GRANT SUPER ON *.* TO '\''monitor'\''@'\''%'\'';
setup    | 
setup    |         CREATE DATABASE IF NOT EXISTS redmine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
setup    |         CREATE USER IF NOT EXISTS '\''redmine'\''@'\''%'\'' IDENTIFIED BY '\''redmine_password'\'';
setup    |         GRANT ALL PRIVILEGES ON redmine.* TO '\''redmine'\''@'\''%'\'';
setup    |         GRANT SELECT ON *.* TO '\''redmine'\''@'\''%'\'';
setup    |         GRANT SUPER ON *.* TO '\''redmine'\''@'\''%'\'';
setup    | 
setup    |         FLUSH PRIVILEGES;
setup    | 
setup    |         CHANGE MASTER TO 
setup    |             MASTER_USER='\''repl_user'\'', 
setup    |             MASTER_PASSWORD='\''repl_pass123'\'' 
setup    |             FOR CHANNEL '\''group_replication_recovery'\'';
setup    | 
setup    |         START GROUP_REPLICATION;
setup    |         SET SQL_LOG_BIN=1;'
master2  | 2025-01-02T01:16:19.103856Z 30 [Warning] Following users were specified in CREATE USER IF NOT EXISTS but they already exist. Corresponding entry in binary log used default authentication plugin 'mysql_native_password' to rewrite authentication information(if any) for them: 'repl_user'@'%'
master2  | 
master2  | 2025-01-02T01:16:19.116111Z 30 [Warning] Neither --relay-log nor --relay-log-index were used; so replication may break when this MySQL server acts as a slave and has his hostname changed!! Please use '--relay-log=master2-relay-bin' to avoid this problem.
master2  | 2025-01-02T01:16:19.168082Z 30 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_recovery' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''.
master2  | 2025-01-02T01:16:19.237018Z 30 [Note] Plugin group_replication reported: 'Group communication SSL configuration: group_replication_ssl_mode: "DISABLED"'
master2  | 2025-01-02T01:16:19.238104Z 30 [Note] Plugin group_replication reported: '[GCS] Translated 'master2' to 172.19.0.3'
master2  | 2025-01-02T01:16:19.238862Z 30 [Warning] Plugin group_replication reported: '[GCS] Automatically adding IPv4 localhost address to the whitelist. It is mandatory that it is added.'
master2  | 2025-01-02T01:16:19.239118Z 30 [Note] Plugin group_replication reported: '[GCS] SSL was not enabled'
master2  | 2025-01-02T01:16:19.239136Z 30 [Note] Plugin group_replication reported: 'Initialized group communication with configuration: group_replication_group_name: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"; group_replication_local_address: "master2:24902"; group_replication_group_seeds: "master1:24901,master2:24902,master3:24903"; group_replication_bootstrap_group: false; group_replication_poll_spin_loops: 0; group_replication_compression_threshold: 1000000; group_replication_ip_whitelist: "0.0.0.0/0"'
master2  | 2025-01-02T01:16:19.239149Z 30 [Note] Plugin group_replication reported: '[GCS] Configured number of attempts to join: 0'
master2  | 2025-01-02T01:16:19.239151Z 30 [Note] Plugin group_replication reported: '[GCS] Configured time between attempts to join: 5 seconds'
master2  | 2025-01-02T01:16:19.239160Z 30 [Note] Plugin group_replication reported: 'Member configuration: member_id: 2; member_uuid: "72cc1ba5-c8a6-11ef-a224-0242ac130003"; single-primary mode: "false"; group_replication_auto_increment_increment: 7; '
master2  | 2025-01-02T01:16:19.239276Z 32 [Note] Plugin group_replication reported: 'Detected previous RESET MASTER invocation or an issue exists in the group replication applier relay log. Purging existing applier logs.'
master2  | 2025-01-02T01:16:19.312011Z 32 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_applier' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='<NULL>', master_port= 0, master_log_file='', master_log_pos= 4, master_bind=''.
master2  | 2025-01-02T01:16:19.461689Z 35 [Note] Slave SQL thread for channel 'group_replication_applier' initialized, starting replication in log 'FIRST' at position 0, relay log './master2-relay-bin-group_replication_applier.000001' position: 4
master2  | 2025-01-02T01:16:19.461705Z 30 [Note] Plugin group_replication reported: 'Group Replication applier module successfully initialized!'
master2  | 2025-01-02T01:16:19.461758Z 30 [Note] Plugin group_replication reported: 'auto_increment_increment is set to 7'
master2  | 2025-01-02T01:16:19.461760Z 30 [Note] Plugin group_replication reported: 'auto_increment_offset is set to 2'
master2  | 2025-01-02T01:16:19.477334Z 0 [Note] Plugin group_replication reported: 'XCom protocol version: 3'
master2  | 2025-01-02T01:16:19.477367Z 0 [Note] Plugin group_replication reported: 'XCom initialized and ready to accept incoming connections on port 24902'
master1  | 2025-01-02T01:16:24.215645Z 0 [Note] Plugin group_replication reported: 'Members joined the group: master2:3306'
master1  | 2025-01-02T01:16:24.215711Z 0 [Note] Plugin group_replication reported: 'Group membership changed to master1:3306, master2:3306 on view 17357805121158071:2.'
master2  | 2025-01-02T01:16:24.215934Z 38 [Note] Plugin group_replication reported: 'Establishing group recovery connection with a possible donor. Attempt 1/10'
master2  | 2025-01-02T01:16:24.215936Z 0 [Note] Plugin group_replication reported: 'Group membership changed to master1:3306, master2:3306 on view 17357805121158071:2.'
master2  | 2025-01-02T01:16:24.361361Z 38 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_recovery' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='master1', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''.
master2  | 2025-01-02T01:16:24.478918Z 38 [Note] Plugin group_replication reported: 'Establishing connection to a group replication recovery donor 6948759d-c8a6-11ef-913b-0242ac130002 at master1 port: 3306.'
master2  | 2025-01-02T01:16:24.479437Z 39 [Warning] Storing MySQL user name or password information in the master info repository is not secure and is therefore not recommended. Please consider using the USER and PASSWORD connection options for START SLAVE; see the 'START SLAVE Syntax' in the MySQL Manual for more information.
master2  | 2025-01-02T01:16:24.481976Z 39 [Note] Slave I/O thread for channel 'group_replication_recovery': connected to master 'repl_user@master1:3306',replication started in log 'FIRST' at position 4
master2  | 2025-01-02T01:16:24.489407Z 40 [Note] Slave SQL thread for channel 'group_replication_recovery' initialized, starting replication in log 'FIRST' at position 0, relay log './master2-relay-bin-group_replication_recovery.000001' position: 4
master1  | 2025-01-02T01:16:24.490851Z 45 [Note] Start binlog_dump to master_thread_id(45) slave_server(2), pos(, 4)
master2  | 2025-01-02T01:16:24.631625Z 38 [Note] Plugin group_replication reported: 'Terminating existing group replication donor connection and purging the corresponding logs.'
master2  | 2025-01-02T01:16:24.640948Z 40 [Note] Slave SQL thread for channel 'group_replication_recovery' exiting, replication stopped in log 'mysql-bin.000001' at position 758
master2  | 2025-01-02T01:16:24.651080Z 39 [Note] Slave I/O thread killed while reading event for channel 'group_replication_recovery'
master2  | 2025-01-02T01:16:24.651112Z 39 [Note] Slave I/O thread exiting for channel 'group_replication_recovery', read up to log 'mysql-bin.000001', position 758
master2  | 2025-01-02T01:16:24.861021Z 38 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_recovery' executed'. Previous state master_host='master1', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='<NULL>', master_port= 0, master_log_file='', master_log_pos= 4, master_bind=''.
master2  | 2025-01-02T01:16:24.980434Z 0 [Note] Plugin group_replication reported: 'This server was declared online within the replication group'
master1  | 2025-01-02T01:16:24.980363Z 0 [Note] Plugin group_replication reported: 'The member with address master2:3306 was declared online within the replication group'
setup    | + check_mysql_command_result
setup    | + '[' 0 -ne 0 ']'
setup    | + sleep 30
setup    | Master2 setup completed!
setup    | Initializing other master...
setup    | + echo 'Master2 setup completed!'
setup    | + for i in 2 3
setup    | + initialize_other_master /tmp/master3.cnf
setup    | + local cnf_file=/tmp/master3.cnf
setup    | + echo 'Initializing other master...'
setup    | + mysql --defaults-file=/tmp/master3.cnf -e '
setup    |         STOP GROUP_REPLICATION;
setup    |         RESET MASTER;
setup    |         SET GLOBAL super_read_only=0;
setup    |         SET GLOBAL read_only=0;
setup    |         SET SQL_LOG_BIN=0;
setup    | 
setup    |         CREATE USER IF NOT EXISTS '\''repl_user'\''@'\''%'\'' IDENTIFIED BY '\''repl_pass123'\'';
setup    |         GRANT REPLICATION SLAVE ON *.* TO '\''repl_user'\''@'\''%'\'';
setup    |         GRANT REPLICATION CLIENT ON *.* TO '\''repl_user'\''@'\''%'\'';
setup    |         GRANT SELECT ON performance_schema.* TO '\''repl_user'\''@'\''%'\'';
setup    |         GRANT SUPER ON *.* TO '\''repl_user'\''@'\''%'\'';
setup    | 
setup    |         # ProxySQL monitor user'\''ı ekle
setup    |         CREATE USER IF NOT EXISTS '\''monitor'\''@'\''%'\'' IDENTIFIED BY '\''monitor'\'';
setup    |         GRANT REPLICATION CLIENT ON *.* TO '\''monitor'\''@'\''%'\'';
setup    |         GRANT SELECT ON *.* TO '\''monitor'\''@'\''%'\'';
setup    |         GRANT SUPER ON *.* TO '\''monitor'\''@'\''%'\'';
setup    | 
setup    |         CREATE DATABASE IF NOT EXISTS redmine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
setup    |         CREATE USER IF NOT EXISTS '\''redmine'\''@'\''%'\'' IDENTIFIED BY '\''redmine_password'\'';
setup    |         GRANT ALL PRIVILEGES ON redmine.* TO '\''redmine'\''@'\''%'\'';
setup    |         GRANT SELECT ON *.* TO '\''redmine'\''@'\''%'\'';
setup    |         GRANT SUPER ON *.* TO '\''redmine'\''@'\''%'\'';
setup    | 
setup    |         FLUSH PRIVILEGES;
setup    | 
setup    |         CHANGE MASTER TO 
setup    |             MASTER_USER='\''repl_user'\'', 
setup    |             MASTER_PASSWORD='\''repl_pass123'\'' 
setup    |             FOR CHANNEL '\''group_replication_recovery'\'';
setup    | 
setup    |         START GROUP_REPLICATION;
setup    |         SET SQL_LOG_BIN=1;'
master3  | 2025-01-02T01:16:58.237461Z 32 [Warning] Following users were specified in CREATE USER IF NOT EXISTS but they already exist. Corresponding entry in binary log used default authentication plugin 'mysql_native_password' to rewrite authentication information(if any) for them: 'repl_user'@'%'
master3  | 
master3  | 2025-01-02T01:16:58.258186Z 32 [Warning] Neither --relay-log nor --relay-log-index were used; so replication may break when this MySQL server acts as a slave and has his hostname changed!! Please use '--relay-log=master3-relay-bin' to avoid this problem.
master3  | 2025-01-02T01:16:58.314023Z 32 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_recovery' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''.
master3  | 2025-01-02T01:16:58.391441Z 32 [Note] Plugin group_replication reported: 'Group communication SSL configuration: group_replication_ssl_mode: "DISABLED"'
master3  | 2025-01-02T01:16:58.392708Z 32 [Note] Plugin group_replication reported: '[GCS] Translated 'master3' to 172.19.0.4'
master3  | 2025-01-02T01:16:58.393673Z 32 [Warning] Plugin group_replication reported: '[GCS] Automatically adding IPv4 localhost address to the whitelist. It is mandatory that it is added.'
master3  | 2025-01-02T01:16:58.393806Z 32 [Note] Plugin group_replication reported: '[GCS] SSL was not enabled'
master3  | 2025-01-02T01:16:58.393822Z 32 [Note] Plugin group_replication reported: 'Initialized group communication with configuration: group_replication_group_name: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"; group_replication_local_address: "master3:24903"; group_replication_group_seeds: "master1:24901,master2:24902,master3:24903"; group_replication_bootstrap_group: false; group_replication_poll_spin_loops: 0; group_replication_compression_threshold: 1000000; group_replication_ip_whitelist: "0.0.0.0/0"'
master3  | 2025-01-02T01:16:58.393839Z 32 [Note] Plugin group_replication reported: '[GCS] Configured number of attempts to join: 0'
master3  | 2025-01-02T01:16:58.393843Z 32 [Note] Plugin group_replication reported: '[GCS] Configured time between attempts to join: 5 seconds'
master3  | 2025-01-02T01:16:58.393857Z 32 [Note] Plugin group_replication reported: 'Member configuration: member_id: 3; member_uuid: "8112c2d5-c8a6-11ef-a55c-0242ac130004"; single-primary mode: "false"; group_replication_auto_increment_increment: 7; '
master3  | 2025-01-02T01:16:58.394067Z 34 [Note] Plugin group_replication reported: 'Detected previous RESET MASTER invocation or an issue exists in the group replication applier relay log. Purging existing applier logs.'
master3  | 2025-01-02T01:16:58.475153Z 34 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_applier' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='<NULL>', master_port= 0, master_log_file='', master_log_pos= 4, master_bind=''.
master3  | 2025-01-02T01:16:58.603668Z 37 [Note] Slave SQL thread for channel 'group_replication_applier' initialized, starting replication in log 'FIRST' at position 0, relay log './master3-relay-bin-group_replication_applier.000001' position: 4
master3  | 2025-01-02T01:16:58.603728Z 32 [Note] Plugin group_replication reported: 'Group Replication applier module successfully initialized!'
master3  | 2025-01-02T01:16:58.603741Z 32 [Note] Plugin group_replication reported: 'auto_increment_increment is set to 7'
master3  | 2025-01-02T01:16:58.603743Z 32 [Note] Plugin group_replication reported: 'auto_increment_offset is set to 3'
master3  | 2025-01-02T01:16:58.618485Z 0 [Note] Plugin group_replication reported: 'XCom protocol version: 3'
master3  | 2025-01-02T01:16:58.618503Z 0 [Note] Plugin group_replication reported: 'XCom initialized and ready to accept incoming connections on port 24903'
master1  | 2025-01-02T01:17:03.640759Z 0 [Note] Plugin group_replication reported: 'Members joined the group: master3:3306'
master1  | 2025-01-02T01:17:03.640922Z 0 [Note] Plugin group_replication reported: 'Group membership changed to master1:3306, master2:3306, master3:3306 on view 17357805121158071:3.'
master2  | 2025-01-02T01:17:03.640821Z 0 [Note] Plugin group_replication reported: 'Members joined the group: master3:3306'
master2  | 2025-01-02T01:17:03.640974Z 0 [Note] Plugin group_replication reported: 'Group membership changed to master1:3306, master2:3306, master3:3306 on view 17357805121158071:3.'
master3  | 2025-01-02T01:17:03.641479Z 40 [Note] Plugin group_replication reported: 'Establishing group recovery connection with a possible donor. Attempt 1/10'
master3  | 2025-01-02T01:17:03.641520Z 0 [Note] Plugin group_replication reported: 'Group membership changed to master1:3306, master2:3306, master3:3306 on view 17357805121158071:3.'
master1  | 2025-01-02T01:17:03.657299Z 45 [Note] Aborted connection 45 to db: 'unconnected' user: 'repl_user' host: 'master2.1slave_default' (failed on flush_net())
master3  | 2025-01-02T01:17:03.812243Z 40 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_recovery' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='master2', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''.
master3  | 2025-01-02T01:17:03.927275Z 40 [Note] Plugin group_replication reported: 'Establishing connection to a group replication recovery donor 72cc1ba5-c8a6-11ef-a224-0242ac130003 at master2 port: 3306.'
master3  | 2025-01-02T01:17:03.927682Z 41 [Warning] Storing MySQL user name or password information in the master info repository is not secure and is therefore not recommended. Please consider using the USER and PASSWORD connection options for START SLAVE; see the 'START SLAVE Syntax' in the MySQL Manual for more information.
master3  | 2025-01-02T01:17:03.929850Z 41 [Note] Slave I/O thread for channel 'group_replication_recovery': connected to master 'repl_user@master2:3306',replication started in log 'FIRST' at position 4
master3  | 2025-01-02T01:17:03.937408Z 42 [Note] Slave SQL thread for channel 'group_replication_recovery' initialized, starting replication in log 'FIRST' at position 0, relay log './master3-relay-bin-group_replication_recovery.000001' position: 4
master2  | 2025-01-02T01:17:03.938482Z 48 [Note] Start binlog_dump to master_thread_id(48) slave_server(3), pos(, 4)
master3  | 2025-01-02T01:17:04.059013Z 40 [Note] Plugin group_replication reported: 'Terminating existing group replication donor connection and purging the corresponding logs.'
master3  | 2025-01-02T01:17:04.068320Z 42 [Note] Slave SQL thread for channel 'group_replication_recovery' exiting, replication stopped in log 'mysql-bin.000001' at position 1082
master3  | 2025-01-02T01:17:04.078393Z 41 [Note] Slave I/O thread killed while reading event for channel 'group_replication_recovery'
master3  | 2025-01-02T01:17:04.078419Z 41 [Note] Slave I/O thread exiting for channel 'group_replication_recovery', read up to log 'mysql-bin.000001', position 1082
master3  | 2025-01-02T01:17:04.235305Z 40 [Note] 'CHANGE MASTER TO FOR CHANNEL 'group_replication_recovery' executed'. Previous state master_host='master2', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='<NULL>', master_port= 0, master_log_file='', master_log_pos= 4, master_bind=''.
master2  | 2025-01-02T01:17:04.343349Z 0 [Note] Plugin group_replication reported: 'The member with address master3:3306 was declared online within the replication group'
master1  | 2025-01-02T01:17:04.343335Z 0 [Note] Plugin group_replication reported: 'The member with address master3:3306 was declared online within the replication group'
master3  | 2025-01-02T01:17:04.343378Z 0 [Note] Plugin group_replication reported: 'This server was declared online within the replication group'
setup    | + check_mysql_command_result
setup    | + '[' 0 -ne 0 ']'
setup    | + sleep 30
setup    | Master3 setup completed!
setup    | Checking group replication status...
setup    | + echo 'Master3 setup completed!'
setup    | + check_replication
setup    | + echo 'Checking group replication status...'
setup    | + mysql --defaults-file=/tmp/master1.cnf -e '
setup    |         SELECT *
setup    |         FROM performance_schema.replication_group_members
setup    |         WHERE MEMBER_STATE='\''ONLINE'\'';'
setup    | CHANNEL_NAME MEMBER_ID       MEMBER_HOST     MEMBER_PORT     MEMBER_STATE
setup    | group_replication_applier    6948759d-c8a6-11ef-913b-0242ac130002    master1 3306    ONLINE
setup    | group_replication_applier    72cc1ba5-c8a6-11ef-a224-0242ac130003    master2 3306    ONLINE
setup    | group_replication_applier    8112c2d5-c8a6-11ef-a55c-0242ac130004    master3 3306    ONLINE
setup    | + '[' 0 -ne 0 ']'
setup    | + initialize_slave /tmp/slave.cnf
setup    | + local cnf_file=/tmp/slave.cnf
setup    | + echo 'Initializing slave...'
setup    | + mysql --defaults-file=/tmp/slave.cnf -e '
setup    |         STOP SLAVE;
setup    |         RESET SLAVE;
setup    |         SET GLOBAL super_read_only=0;
setup    |         SET GLOBAL read_only=0;
setup    |         SET SQL_LOG_BIN=0;
setup    | 
setup    |         CREATE USER IF NOT EXISTS '\''repl_user'\''@'\''%'\'' IDENTIFIED BY '\''repl_pass123'\'';
setup    |         GRANT REPLICATION SLAVE ON *.* TO '\''repl_user'\''@'\''%'\'';
setup    | Initializing slave...
setup    |         CREATE USER IF NOT EXISTS '\''redmine'\''@'\''%'\'' IDENTIFIED BY '\''redmine_password'\'';
setup    |         GRANT ALL PRIVILEGES ON redmine.* TO '\''redmine'\''@'\''%'\'';
setup    |         GRANT SELECT ON *.* TO '\''redmine'\''@'\''%'\'';
setup    |         GRANT SUPER ON *.* TO '\''redmine'\''@'\''%'\'';
setup    |         
setup    |         FLUSH PRIVILEGES;
setup    | 
setup    | 
setup    |         CHANGE MASTER TO 
setup    |             MASTER_HOST='\''master1'\'',
setup    |             MASTER_USER='\''repl_user'\'', 
setup    |             MASTER_PASSWORD='\''repl_pass123'\'',
setup    |             MASTER_AUTO_POSITION=1;
setup    | 
setup    |         START SLAVE;
setup    |         SET SQL_LOG_BIN=1;'
slave    | 2025-01-02T01:17:34.686300Z 33 [Warning] Following users were specified in CREATE USER IF NOT EXISTS but they already exist. Corresponding entry in binary log used default authentication plugin 'mysql_native_password' to rewrite authentication information(if any) for them: 'repl_user'@'%'
slave    | 
slave    | 2025-01-02T01:17:34.761421Z 33 [Note] 'CHANGE MASTER TO FOR CHANNEL '' executed'. Previous state master_host='', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''. New state master_host='master1', master_port= 3306, master_log_file='', master_log_pos= 4, master_bind=''.
slave    | 2025-01-02T01:17:34.826728Z 34 [Warning] Storing MySQL user name or password information in the master info repository is not secure and is therefore not recommended. Please consider using the USER and PASSWORD connection options for START SLAVE; see the 'START SLAVE Syntax' in the MySQL Manual for more information.
slave    | 2025-01-02T01:17:34.829762Z 34 [Note] Slave I/O thread for channel '': connected to master 'repl_user@master1:3306',replication started in log 'FIRST' at position 4
slave    | 2025-01-02T01:17:34.836333Z 35 [Note] Slave SQL thread for channel '' initialized, starting replication in log 'FIRST' at position 0, relay log './slave-relay-bin.000001' position: 4
master1  | 2025-01-02T01:17:34.837260Z 55 [Note] Start binlog_dump to master_thread_id(55) slave_server(4), pos(, 4)
setup    | + check_mysql_command_result
setup    | + '[' 0 -ne 0 ']'
setup    | + sleep 30
master2  | 2025-01-02T01:18:03.939077Z 48 [Note] Aborted connection 48 to db: 'unconnected' user: 'repl_user' host: 'master3.1slave_default' (failed on flush_net())
setup    | + mysql --defaults-file=/tmp/slave.cnf -e 'SHOW SLAVE STATUS\G'
setup    | *************************** 1. row ***************************
setup    |                Slave_IO_State: Waiting for master to send event
setup    |                   Master_Host: master1
setup    |                   Master_User: repl_user
setup    |                   Master_Port: 3306
setup    |                 Connect_Retry: 60
setup    |               Master_Log_File: mysql-bin.000001
setup    |           Read_Master_Log_Pos: 1082
setup    |                Relay_Log_File: slave-relay-bin.000002
setup    |                 Relay_Log_Pos: 1295
setup    |         Relay_Master_Log_File: mysql-bin.000001
setup    |              Slave_IO_Running: Yes
setup    |             Slave_SQL_Running: Yes
setup    |               Replicate_Do_DB: 
setup    |           Replicate_Ignore_DB: 
setup    |            Replicate_Do_Table: 
setup    |        Replicate_Ignore_Table: 
setup    |       Replicate_Wild_Do_Table: 
setup    |   Replicate_Wild_Ignore_Table: 
setup    |                    Last_Errno: 0
setup    |                    Last_Error: 
setup    |                  Skip_Counter: 0
setup    |           Exec_Master_Log_Pos: 1082
setup    |               Relay_Log_Space: 1502
setup    |               Until_Condition: None
setup    |                Until_Log_File: 
setup    |                 Until_Log_Pos: 0
setup    |            Master_SSL_Allowed: No
setup    |            Master_SSL_CA_File: 
setup    |            Master_SSL_CA_Path: 
setup    |               Master_SSL_Cert: 
setup    |             Master_SSL_Cipher: 
setup    |                Master_SSL_Key: 
setup    |         Seconds_Behind_Master: 0
setup    | Master_SSL_Verify_Server_Cert: No
setup    |                 Last_IO_Errno: 0
setup    |                 Last_IO_Error: 
setup    |                Last_SQL_Errno: 0
setup    |                Last_SQL_Error: 
setup    |   Replicate_Ignore_Server_Ids: 
setup    |              Master_Server_Id: 1
setup    |                   Master_UUID: 6948759d-c8a6-11ef-913b-0242ac130002
setup    |              Master_Info_File: mysql.slave_master_info
setup    |                     SQL_Delay: 0
setup    |           SQL_Remaining_Delay: NULL
setup    |       Slave_SQL_Running_State: Slave has read all relay log; waiting for more updates
setup    |            Master_Retry_Count: 86400
setup    |                   Master_Bind: 
setup    |       Last_IO_Error_Timestamp: 
setup    |      Last_SQL_Error_Timestamp: 
setup    |                Master_SSL_Crl: 
setup    |            Master_SSL_Crlpath: 
setup    |            Retrieved_Gtid_Set: aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee:1-3
setup    |             Executed_Gtid_Set: 8c3884e1-c8a6-11ef-b041-0242ac130005:1-6,
setup    | aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee:1-3
setup    |                 Auto_Position: 1
setup    |          Replicate_Rewrite_DB: 
setup    |                  Channel_Name: 
setup    |            Master_TLS_Version: 
setup    | ++ [[ 0 -eq 0 ]]
setup    | ++ echo success
setup    | Slave setup completed with success
setup    | + echo 'Slave setup completed with success'
setup exited with code 0
```