FROM debian:buster


RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vsftpd

RUN service vsftpd start
RUN adduser yachehbo --gecos "" && \
    echo "yachehbo:yachehbo123" | chpasswd 

RUN echo "anonymous_enable=NO" >> /etc/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd.conf && \
    echo "chroot_local_user=YES" >> /etc/vsftpd.conf && \
    echo "local_root=/" >> /etc/vsftpd.conf

RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf

RUN echo "yachehbo" | tee -a /etc/vsftpd.userlist

RUN service vsftpd stop


ENTRYPOINT [ "/usr/sbin/vsftpd"]