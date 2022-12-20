#!/bin/sh

service mysql start;

mysql -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

result=$(mysql -u ${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "SELECT COUNT(*) FROM mysql.user WHERE User='${DB_USER}';")
echo $result
if [[ $result =~ "1" ]]; then
  echo "User already exist"
else
  mysql -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
fi

mysql -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u${DB_ROOT_USER} -e "FLUSH PRIVILEGES;"
sleep 2
mysql -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "ALTER USER '${DB_ROOT_USER}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysqladmin -u ${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} shutdown
exec mysqld_safe