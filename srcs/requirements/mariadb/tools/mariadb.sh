# !bin/bash


mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${ROOT_PASSWORD}');"
mysql -uroot -p$ROOT_PASSWORD -e "show databases;"


mysql -u root -p$ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS  ${DATABASE};"
mysql -u root -p$ROOT_PASSWORD -e "CREATE USER '${USER_NAME}'@'%' IDENTIFIED BY '${USER_PASSWORD}';"
mysql -u root -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER_NAME}'@'%';"
mysql -u root -p$ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysql -u root -p$ROOT_PASSWORD -e "show databases;"
