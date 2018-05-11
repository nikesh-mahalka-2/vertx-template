#/usr/bin/sh
while true
do
psql -U test -d test -c '\dt'
done
