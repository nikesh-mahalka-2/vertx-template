echo "Please change password"
while passwd
do
psql -U test -d test -c '\dt'
done
