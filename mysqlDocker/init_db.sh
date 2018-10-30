#!/bin/bash
/usr/bin/mysqld_safe --skip-grant-tables &
sleep 5
mysql -u root -e "CREATE DATABASE stage"
mysql -u root mydb < /tmp/stage.sql


######init_db.sh########
