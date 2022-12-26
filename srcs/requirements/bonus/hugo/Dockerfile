FROM debian:buster

WORKDIR /var/hugo/me

RUN apt update -y && apt upgrade -y && \
    apt install -y hugo && \
    apt install -y git

RUN hugo new site /var/hugo/me && \
    cd /var/hugo/me && \
    git clone https://github.com/shenoybr/hugo-goa.git themes/hugo-goa && \
    hugo -b https://yachehbo.42.fr/me

COPY ./conf/config.toml /var/hugo/me/config.toml

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://yachehbo.42.fr/me", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]