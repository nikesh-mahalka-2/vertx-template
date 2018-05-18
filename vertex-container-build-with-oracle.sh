#!/bin/bash

echo "Print Docker Host"
echo $DOCKER_HOST
sudo apt-get update

mvn install:install-file -Dfile=./ojdbc7.jar -DgroupId=com.oracle.jdbc -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar
sudo docker login -u nike1niec -p $DOCKER_LOGIN
sudo docker run -d -it --name vertx-oracle-db -P store/oracle/database-enterprise:12.2.0.1-slim
ORACLE_DB_IP="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' vertx-oracle-db)"
mvn -DskipTests clean package

DB_HEALTH=""
while [ "${DB_HEALTH}" != "\"healthy\"" ]
do
  DB_HEALTH="$(sudo docker inspect --format='{{json .State.Health.Status}}' vertx-oracle-db)"
  sleep 5
  echo $DB_HEALTH
done


#java -Ddatabase.url=jdbc:oracle:thin:@"${ORACLE_DB_IP}":1521/ORCLCDB.localdomain -Djava.security.egd=file:/dev/./urandom -jar target/vertx-*-SNAPSHOT.jar create-database run

echo "print database IP"
echo $ORACLE_DB_IP

echo java -Ddatabase.url=jdbc:oracle:thin:@"${ORACLE_DB_IP}":1521/ORCLCDB.localdomain -Djava.security.egd=file:/dev/./urandom -jar target/vertx-*-SNAPSHOT.jar create-database run

java -Ddatabase.url=jdbc:oracle:thin:@"${ORACLE_DB_IP}":1521/ORCLCDB.localdomain -Djava.security.egd=file:/dev/./urandom -jar target/vertx-*-SNAPSHOT.jar create-database run
