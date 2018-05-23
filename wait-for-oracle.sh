#!/bin/bash
set -e

until tnsping workspace_dbserver_1; do
  >&2 echo "Oracle is unavailable - sleeping"
  sleep 30
done

>&2 echo "Oracle is up - executing command"
exec "/bin/bash ls"
