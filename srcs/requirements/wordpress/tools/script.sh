#!bin/bash
# sleep 5
# if [ ! -e /var/www/html/wordpress/wp-config.php ]; then
    wp config create	--allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --path='/var/www/html/wordpress'
    sleep 5
    wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ROOT_USER} --admin_password=${WP_ROOT_PASSWORD} --admin_email=${WP_ROOT_EMAIL} --path='/var/www/html/wordpress' --allow-root
    wp user create ${WP_USER} ${WP_USER_EMAIL}  --user_pass=${WP_PASSWORD} --role=author --path='/var/www/html/wordpress' --allow-root
    wp config set WP_REDIS_HOST redis --allow-root  --path='/var/www/html/wordpress'
    service php7.3-fpm start
	wp plugin install redis-cache --allow-root --path='/var/www/html/wordpress'
    wp plugin activate redis-cache --allow-root --path='/var/www/html/wordpress'
	wp redis enable --allow-root --path='/var/www/html/wordpress'
    service php7.3-fpm stop
# fi

mkdir -p ./run/php/
/usr/sbin/php-fpm7.3 -F
