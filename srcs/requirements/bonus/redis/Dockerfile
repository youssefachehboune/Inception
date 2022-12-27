FROM debian:buster
RUN apt-get update && apt-get install -y redis

RUN sed -i "s|127.0.0.1|0.0.0.0|g" /etc/redis/redis.conf && \
    sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g" /etc/redis/redis.conf && \
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

EXPOSE 6379

CMD [ "redis-server", "--protected-mode", "no" ]