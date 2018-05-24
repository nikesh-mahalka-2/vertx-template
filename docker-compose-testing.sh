#!/bin/bash
echo "docker login"
docker login -u nike1niec -p $DOCKER_LOGIN
echo "docker-compose up -d dbserver" 
docker-compose up -d dbserver

echo "checking database health to be healthy"
DB_HEALTH=""
while [ "${DB_HEALTH}" != "\"healthy\"" ]
do
  DB_HEALTH="$(docker inspect --format='{{json .State.Health.Status}}' dbserver)"
  sleep 10
  echo $DB_HEALTH
done

echo "running docker-compose up appserver"
docker-compose up appserver

docker-compose down
