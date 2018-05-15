#!/bin/bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
psql -U postgres -c "create user test with password 'test';"
psql -c 'create database test owner test;' -U postgres
psql -U test -d test -c '\dt'
