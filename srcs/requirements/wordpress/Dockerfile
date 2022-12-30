FROM	debian:buster

RUN		apt-get update && apt-get -y install php-fpm php-mysql mariadb-client wget curl

WORKDIR /var/www/html
RUN		wget https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz && rm latest.tar.gz
RUN		chmod 777 /var/www/html/wordpress/

RUN     sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf


RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


COPY	./tools/script.sh /
ENTRYPOINT ["bash", "/script.sh"]