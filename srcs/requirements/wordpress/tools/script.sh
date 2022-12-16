#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php


wp core install --url=https://localhost --title=Inception --admin_user=${WP_ROOT_USER} --admin_password=${WP_ROOT_PASSWORD} --admin_email=yachehbo@student.1337.ma --allow-root
wp user create ${WP_USER} yachehbo@gmail.com --user_pass=${WP_PASSWORD} --allow-root

exec "$@"