FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

COPY ./tools/nginx.sh /nginx.sh
RUN chmod 777 nginx.sh && ./nginx.sh

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
