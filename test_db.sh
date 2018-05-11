#/usr/bin/sh
while true
do
sleep 5
psql -U test -d test -c '\dt'
done
