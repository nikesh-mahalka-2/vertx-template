#!/bin/bash
echo "docker login"
docker login -u nike1niec -p $DOCKER_LOGIN
docker-compose up -d dbserver

DB_HEALTH=""
while [ "${DB_HEALTH}" != "\"healthy\"" ]
do
  DB_HEALTH="$(docker inspect --format='{{json .State.Health.Status}}' dbserver)"
  sleep 5
  echo $DB_HEALTH
done

docker-compose up appserver
