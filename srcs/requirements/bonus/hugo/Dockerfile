FROM debian:buster


RUN apt update -y && apt install -y hugo git

WORKDIR /var/hugo/me

RUN hugo new site ./ && \
    git clone https://github.com/shenoybr/hugo-goa.git themes/hugo-goa && \
    hugo -b https://yachehbo.42.fr/me

COPY ./conf/config.toml ./config.toml

EXPOSE 1313

CMD     ["hugo", "server", "--bind=0.0.0.0", "--baseURL=https://yachehbo.42.fr/me", "-p", "1313", "--appendPort=false"]