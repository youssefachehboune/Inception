FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

COPY ./tools/nginx.sh /nginx.sh

RUN chmod 777 nginx.sh && ./nginx.sh

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-available/default

CMD [ "nginx", "-g", "daemon off;" ]