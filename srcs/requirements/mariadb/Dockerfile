FROM	alpine:3.12.0

RUN apk update \
	apk add mariadb mariadb-client

RUN		apk add openrc
RUN		openrc
RUN 	touch /run/openrc/softlevel

RUN		apk add mariadb

COPY	./tools/script.sh /
RUN		chmod +x /script.sh

ENTRYPOINT	[ "/script.sh" ]