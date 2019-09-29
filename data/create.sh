#!/bin/bash
set -e
mysql -u root --password=password $DATABASE_NAME < /data/season.sql
