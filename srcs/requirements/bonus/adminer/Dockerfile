FROM debian:buster

RUN apt-get update && apt-get install -y php7.3 wget php-mysql

RUN wget "http://www.adminer.org/latest.php" -O adminer.php

EXPOSE 9001

CMD [ "php7.3", "-S", "0.0.0.0:9001", "adminer.php" ]