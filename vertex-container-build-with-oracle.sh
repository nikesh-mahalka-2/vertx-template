#!/bin/bash
sudo apt-get update
sudo apt-get install net-tools -y



echo "print IP"
hostname -I

sudo docker run -d -it --name vertx-oracle-db alpine
ORACLE_DB_IP="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' vertx-oracle-db)"

echo "container IP"
echo $ORACLE_DB_IP

echo "printing network interface"
ifconfig

echo "linux processes"
ps aux


echo "tcp processes"
netstat -tunlp


echo "print OS type"
cat /etc/lsb*



echo "print uname info"
uname -a
