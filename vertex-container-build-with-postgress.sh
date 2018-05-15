#!/bin/bash

sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y
service postgresql status
psql -U postgres -h 127.0.0.1 -c "create user test with password 'test';"
psql -h 127.0.0.1 -c 'create database test owner test;' -U postgres
psql -h 127.0.0.1 -U test -d test -c '\dt'
