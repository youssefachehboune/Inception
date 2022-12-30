FROM debian:buster


RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vsftpd

RUN adduser yachehbo --gecos "" && \
    echo "yachehbo:yachehbo123" | chpasswd 


RUN echo "anonymous_enable=NO" >> /etc/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd.conf && \
    echo "chroot_local_user=YES" >> /etc/vsftpd.conf && \
    echo "local_root=/var/www/html/wordpress" >> /etc/vsftpd.conf

RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf

ENTRYPOINT [ "/usr/sbin/vsftpd"]