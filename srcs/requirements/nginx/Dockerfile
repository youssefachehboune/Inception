FROM debian:buster

RUN apt-get update && apt-get install -y sudo && apt-get install -y nginx && apt-get install -y openssl && apt-get install -y vim

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-available/default 

CMD [ "nginx", "-g", "daemon off;" ]
