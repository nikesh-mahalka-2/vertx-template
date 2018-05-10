#!/bin/bash
PG_VERSION=10

sleep 20
# Restart so that all new config is loaded:
#service postgresql restart

ls -l /workspace
echo "IP=`hostname -I`" > /workspace/ip.txt


cat /workspace/ip.txt
source /workspace/ip.txt
echo $IP
sleep 120
