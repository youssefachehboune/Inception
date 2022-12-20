FROM	debian:buster

RUN		apt-get update -y && apt-get -y install php7.3 php-fpm php-mysql mariadb-client wget curl

WORKDIR /var/www/html
RUN		wget https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz && rm latest.tar.gz

RUN     sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = wordpress:9000/' /etc/php/7.3/fpm/pool.d/www.conf

RUN		chown -R root:root ./wordpress

WORKDIR /
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


COPY	./tools/script.sh /
ENTRYPOINT ["bash", "/script.sh"]