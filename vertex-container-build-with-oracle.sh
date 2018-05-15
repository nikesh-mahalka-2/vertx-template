#!/bin/bash
sudo apt-get update
cp settings-security.xml ~/.m2/settings-security.xml

mvn -encrypt-password test


#mvn -DskipTests -Ppostgres clean package
#java -jar target/vertx-template-1.0-SNAPSHOT.jar create-database run
