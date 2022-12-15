# !bin/bash

mysql -u root -e "CREATE DATABASE IF NOT EXISTS  ${DATABASE};"
mysql -u root -e "CREATE USER '${USER_NAME}'@'%' IDENTIFIED BY '${USER_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER_NAME}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
