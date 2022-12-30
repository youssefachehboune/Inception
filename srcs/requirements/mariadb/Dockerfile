FROM debian:buster

RUN apt-get update && apt-get install -y  mariadb-server

EXPOSE 3306

COPY ./tools/mariadb.sh /tmp/mariadb.sh
RUN chmod 777 /tmp/mariadb.sh
RUN sed -i 's/bind-address/# bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "bash", "/tmp/mariadb.sh" ]