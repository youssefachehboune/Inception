FROM debian:buster

RUN apt-get update && apt-get install -y sudo && apt-get install -y mariadb-server

COPY ./tools/mariadb.sh /mariadb.sh
COPY .env /.env

RUN chmod 777 mariadb.sh \
    && chmod 777 .env

RUN service mysql start \
    && export $(cat .env | xargs) \
    && ./mariadb.sh

CMD [ "mysqld" ]
