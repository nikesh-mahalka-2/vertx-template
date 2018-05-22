#!/bin/bash
# wait-for-postgres.sh

set -e

host="$1"
shift
cmd="$@"

until java -Ddatabase.url=jdbc:oracle:thin:@vertx-template_dbserver_1:1521/ORCLCDB.localdomain -Djava.security.egd=file:/dev/./urandom -jar /target/vertx-*-SNAPSHOT.jar create-database run; do
  >&2 echo "Oracle is unavailable - sleeping"
  sleep 20
done

>&2 echo "Oracle is up - executing command"
exec $cmd
