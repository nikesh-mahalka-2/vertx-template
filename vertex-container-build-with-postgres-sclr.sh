#!/bin/bash
sudo apt-get update
sudo apt-get install curl -y

sudo apt-get install postgresql postgresql-contrib -y
service postgresql start
service postgresql status
sudo -i -u postgres psql -U postgres  -c "create user test with password 'test';"
sudo -i -u postgres psql -c 'create database test owner test;' -U postgres
PGPASSWORD=test psql  -U test -d test -h localhost -c '\dt'
mvn -DskipTests -Ppostgres clean package

curl -sSL https://download.sourceclear.com/ci.sh | sh

nohup java -jar target/vertx-template-1.0-SNAPSHOT.jar create-database run 2>&1 &
sleep 10
PGPASSWORD=test psql  -U test -d test -h localhost -c '\dt'
