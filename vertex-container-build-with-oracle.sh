#!/bin/bash
sudo apt-get update
mvn –s settings.xml -DskipTests -Poracle clean package

#mvn -DskipTests -Ppostgres clean package
#java -jar target/vertx-template-1.0-SNAPSHOT.jar create-database run
