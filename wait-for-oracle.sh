#!/bin/bash
set -e

until sqlplus sys/Oradoc_db1@dbserver:1521/ORCLCDB.localdomain as sysdba; do
  >&2 echo "Oracle is unavailable - sleeping"
  sleep 30
done

>&2 echo "Oracle is up - executing command"
