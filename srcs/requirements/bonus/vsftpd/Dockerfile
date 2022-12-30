FROM debian:buster


RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vsftpd

RUN service vsftpd start

COPY ./tools/script.sh /
RUN chmod 777 /script.sh

RUN echo "anonymous_enable=NO" >> /etc/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd.conf && \
    echo "chroot_local_user=YES" >> /etc/vsftpd.conf && \
    echo "local_root=/var/www/html/wordpress" >> /etc/vsftpd.conf

RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf

RUN service vsftpd stop

ENTRYPOINT [ "bash", "/script.sh"]