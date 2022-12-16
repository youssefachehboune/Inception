FROM	debian:buster

WORKDIR /var/www/html/wordpress

RUN	apt-get -y update
RUN	apt-get -y install curl\
	php-fpm\
	php-cgi\
	php-mysql

COPY	./tools/script.sh /script.sh
COPY	./conf/wp-config.php /var/www/html/wordpress/wp-config.php
RUN		chmod +x /script.sh

ENTRYPOINT	["/script.sh"]

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]