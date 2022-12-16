# !/bin/bash

mkdir /etc/nginx/ssl
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/yachehbo.key -out /etc/nginx/ssl/yachehbo.crt -subj "/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=1337/OU=yachehbo/CN=yachehbo.42.fr"
# echo "fastcgi_param SCRIPT_FILENAME $fastcgi_script_name;" >> /etc/nginx/fastcgi_params