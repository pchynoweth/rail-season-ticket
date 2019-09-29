#!/bin/bash
set -xe
echo "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))" | mysql -u root --password=password $DATABASE_NAME
chown mysql:mysql /var/lib/mysql-files
