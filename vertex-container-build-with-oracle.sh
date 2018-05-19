#!/bin/bash
sudo apt-get update
sudo apt-get install net-tools -y

#echo "printing docker network network ls"
#docker network ls

echo "print IP"
hostname -I

echo "creating docker container"
sudo docker -D run -d -it --name vertx-oracle-db alpine
ORACLE_DB_IP="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' vertx-oracle-db)"

echo "container IP"
echo $ORACLE_DB_IP

#echo "printing network interface"
#ifconfig
echo "printing docker containers"
sudo docker ps

echo "ping.........."
ping $ORACLE_DB_IP



