#!/bin/bash
sudo apt-get update



mvn -DskipTests -Ppostgres clean package
java -jar target/vertx-template-1.0-SNAPSHOT.jar create-database run
