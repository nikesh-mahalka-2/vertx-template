#!/bin/bash

sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y
service postgresql start
service postgresql status
sudo -i -u postgres psql -U postgres  -c "create user test with password 'test';"
sudo -i -u postgres psql -c 'create database test owner test;' -U postgres
PGPASSWORD=test psql  -U test -d test -h localhost -c '\dt'


