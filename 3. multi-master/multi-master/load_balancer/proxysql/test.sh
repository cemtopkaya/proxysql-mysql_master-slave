#!/bin/bash

# Script to Test ProxySQL Routing

# Variables
PROXYSQL_HOST="proxysql"
PROXYSQL_PORT=6033
PROXYSQL_USER="app_user"
PROXYSQL_PASSWORD="app_pass123"
TEST_DB="test_db"
TEST_TABLE="users"

# Function to execute MySQL commands via ProxySQL
execute_mysql() {
    local query="$1"
    docker compose exec proxysql mysql -h "$PROXYSQL_HOST" -P "$PROXYSQL_PORT" -u "$PROXYSQL_USER" -p"$PROXYSQL_PASSWORD" -e "$query"
}

echo "=== ProxySQL Routing Test Started ==="

for i in {1..15}
do
    echo "=== Test Iteration: $i ==="

    # 1. Insert a Test Record
    echo "Inserting a test record into $TEST_TABLE..."
    execute_mysql "
    USE $TEST_DB;
    INSERT INTO $TEST_TABLE (name) VALUES ('Test User $i');
    "

    # 2. Retrieve Records to Verify Routing
    echo "Retrieving records from $TEST_TABLE..."
    execute_mysql "
    USE $TEST_DB;
    SELECT * FROM $TEST_TABLE;
    "

    # 3. Check ProxySQL Statistics
    echo "Fetching ProxySQL statistics..."
    docker compose exec proxysql mysql -h 127.0.0.1 -P 6032 -uadmin -padmin -e "
    SELECT * FROM stats_mysql_connection_pool WHERE hostgroup IN (10, 11, 20);
    SELECT * FROM stats_mysql_query_rules;
    "

    echo "=== Test Iteration: $i Completed ==="
    echo "-------------------------------------"
done

echo "=== ProxySQL Routing Test Completed ==="