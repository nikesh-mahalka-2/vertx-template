#!/bin/bash
sleep 20
source /workspace/ip.txt
echo $IP

hostname -I


sudo chown -R postgres:postgres /var/lib/postgresql/10/
sudo chmod -R u=rwX,go= /var/lib/postgresql/10/

# Restart so that all new config is loaded:
sudo service postgresql restart


echo "test1"
PGPASSWORD=postgres psql -U postgres -h $IP -c "create user test2 with password 'test2';"
