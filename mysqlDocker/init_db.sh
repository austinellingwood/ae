#!/bin/bash
VAR=$(docker logs mysql-dock2 2>&1 | grep GENERATED)
docker exec -it mysql-dock2 mysql -u root -p$VAR -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('password')"
#sleep 5
mysql -u root -ppassword -e "CREATE DATABASE stage"
mysql -u root -ppassword stage < /tmp/stage.sql


######init_db.sh########
