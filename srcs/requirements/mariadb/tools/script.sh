#!/bin/sh

apk add mysql mysql-client

if [ ! -d "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	/etc/init.d/mariadb start

	mysql -u ${DB_ROOT_USER} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
	mysql -u ${DB_ROOT_USER} -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
	mysql -u ${DB_ROOT_USER} -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
	mysql -u ${DB_ROOT_USER} -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mysql -u ${DB_ROOT_USER} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mysql -u ${DB_ROOT_USER} -e "ALTER USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
	mysql -u ${DB_ROOT_USER} -e "ALTER USER '${DB_ROOT_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
	sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
fi

rc-service mariadb start
rc-service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid