FROM debian:buster

RUN apt-get update && apt-get install -y apache2

RUN sed -i 's/80/81/g' /etc/apache2/ports.conf

COPY ./conf/yachehbo.html /var/www/html/index.html

CMD ["apachectl", "-D", "FOREGROUND"]