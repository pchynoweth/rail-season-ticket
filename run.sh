#!/bin/bash
set -xe
docker-compose up  -d mysql
sleep 10 # wait for mysql to start
docker-compose exec mysql /data/setup.sh
docker-compose run --rm dtd2mysql
docker-compose exec mysql /data/create.sh
docker-compose down
