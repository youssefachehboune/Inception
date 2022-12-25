FROM debian:buster
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y redis 

COPY ./script.sh /
RUN chmod +x script.sh

EXPOSE 6379

CMD [ "sh", "script.sh" ] 
