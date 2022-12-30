# !/bin/sh

if [ ! -d /var/lib/mysql/${DB_NAME} ]; then
  service mysql start

  mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

  mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
  mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
  mysql -e "FLUSH PRIVILEGES;"

  sleep 2
  mysql -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "ALTER USER '${DB_ROOT_USER}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
  mysqladmin -u ${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} shutdown
fi

mysqld_safe