#!/bin/bash
sudo apt-get update
#sudo mkdir -p /root/.m2/
#sudo cp ./settings-security.xml /root/.m2/
#mvn -DskipTests -Poracle package
#mvn -DskipTests -Poracle clean package

#mvn -DskipTests -Ppostgres clean package
#java -jar target/vertx-template-1.0-SNAPSHOT.jar create-database run



gsutil cp gs://delete-oracle-jdbc-jar/ojdbc7.jar .
#sudo docker login -u nike1niec -p $DOCKER_LOGIN
#sudo docker run -d -it --name vertx-oracle-db -P store/oracle/database-enterprise:12.2.0.1-slim



