#!/bin/bash
set -ex

# Hazır client config
cat << EOF > /tmp/node1.cnf
[client]
host=node1
user=root
password=${MYSQL_ROOT_PASSWORD}
EOF

cat << EOF > /tmp/node2.cnf
[client]
host=node2
user=root
password=${MYSQL_ROOT_PASSWORD}
EOF

cat << EOF > /tmp/node3.cnf
[client]
host=node3
user=root
password=${MYSQL_ROOT_PASSWORD}
EOF

# 1) Node1 - Bootstrap
echo "==> Bootstrapping single-primary cluster on Node1..."
mysql --defaults-file=/tmp/node1.cnf -e "
  CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
  GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
  FLUSH PRIVILEGES;

  CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123'
    FOR CHANNEL 'group_replication_recovery';

  STOP GROUP_REPLICATION;
  RESET MASTER;

  -- Sadece bu node1'de BOOTSTRAP aktif
  SET GLOBAL group_replication_bootstrap_group=ON;
  START GROUP_REPLICATION;
  SET GLOBAL group_replication_bootstrap_group=OFF;
"
sleep 10

# 2) Node2 - Join
echo "==> Node2 joining cluster..."
mysql --defaults-file=/tmp/node2.cnf -e "
  CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
  GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
  FLUSH PRIVILEGES;

  CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123'
    FOR CHANNEL 'group_replication_recovery';

  STOP GROUP_REPLICATION;
  RESET MASTER;
  START GROUP_REPLICATION;
"
sleep 10

# 3) Node3 - Join
echo "==> Node3 joining cluster..."
mysql --defaults-file=/tmp/node3.cnf -e "
  CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_pass123';
  GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
  FLUSH PRIVILEGES;

  CHANGE MASTER TO MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass123'
    FOR CHANNEL 'group_replication_recovery';

  STOP GROUP_REPLICATION;
  RESET MASTER;
  START GROUP_REPLICATION;
"
sleep 10

# Kontrol
echo "==> Checking cluster membership on node1..."
mysql --defaults-file=/tmp/node1.cnf -e "
  SELECT * FROM performance_schema.replication_group_members;
"
echo "Done."
