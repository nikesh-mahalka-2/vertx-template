#!/bin/bash
sudo apt-get update
sudo apt-get install curl -y

sudo apt-get install postgresql postgresql-contrib -y
service postgresql start
service postgresql status
sudo -i -u postgres psql -U postgres  -c "create user test with password 'test';"
sudo -i -u postgres psql -c 'create database test owner test;' -U postgres

mvn -DskipTests -Ppostgres clean package

curl -sSL https://download.sourceclear.com/ci.sh | sh  >/dev/null 

nohup java -jar target/vertx-template-1.0-SNAPSHOT.jar create-database run 2>&1
