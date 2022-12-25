FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php7.3 php-fpm php7.3-fpm php-mysql mariadb-client wget curl redis php-redis redis-server

COPY /conf/www.conf /etc/php8/php-fpm.d/www.conf

RUN wget "http://www.adminer.org/latest.php" -O adminer.php

EXPOSE 9001


CMD [ "php7.3", "-S", "0.0.0.0:9001", "adminer.php" ]