#!/bin/bash
set -e

until java -Ddatabase.url=jdbc:oracle:thin:@workspace_dbserver_1:1521/ORCLCDB.localdomain -Djava.security.egd=file:/dev/./urandom -jar ./target/vertx-*-SNAPSHOT.jar create-database run; do
  >&2 echo "Oracle is unavailable - sleeping"
  sleep 30
done

>&2 echo "Oracle is up - executing command"
exec "/bin/bash ls"
