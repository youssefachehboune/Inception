FROM debian:buster

RUN apt-get update && apt-get install -y sudo && apt-get install -y mariadb-server && apt-get install -y mariadb-client

COPY ./conf/script.sh /script.sh
COPY .env /.env

RUN chmod 777 script.sh \
    && chmod 777 .env

RUN service mysql start \
    && export $(cat .env | xargs) \
    && ./script.sh

CMD [ "mysqld" ]

#COPY ./srcs/requirements/mariadb/conf/my.cnf /etc/mysql/my.cnf
