# !bin/bash

echo "______________________________________________________________"
sudo mysql -e "show databases;"
echo "______________________________________________________________"
sudo mysql -e "SELECT user FROM mysql.user;"
echo "______________________________________________________________"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS  ${DB_NAME};"
mysql -u root -e "CREATE USER '${USER_NAME}'@'%' IDENTIFIED BY '${USER_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${USER_NAME}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
echo "_____________________________________________________________"
sudo mysql -e "show databases;"
echo "_____________________________________________________________"
sudo mysql -e "SELECT user FROM mysql.user;"
echo "_____________________________________________________________"


exec "$@"