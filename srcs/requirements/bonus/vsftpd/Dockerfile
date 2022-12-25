FROM debian:buster


RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vsftpd

RUN service vsftpd start
RUN adduser yachehbo --gecos "" && \
    echo "yachehbo:yachehbo123" | chpasswd && \
    mkdir -p /home/yachehbo/ftp && \
    chown -R yachehbo:yachehbo /home/yachehbo/ftp


RUN echo "anonymous_enable=NO" >> /etc/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd.conf && \
    echo "chroot_local_user=YES" >> /etc/vsftpd.conf && \
    echo "user_sub_token=yachehbo" >> /etc/vsftpd.conf && \
    echo "local_root=/home/yachehbo/ftp" >> /etc/vsftpd.conf && \
    echo "pasv_min_port=40000" >> /etc/vsftpd.conf && \
    echo "pasv_max_port=40005" >> /etc/vsftpd.conf && \
    echo "userlist_enable=YES" >> /etc/vsftpd.conf && \
    echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf && \
    echo "userlist_deny=NO" >> /etc/vsftpd.conf 


RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf

RUN echo "yachehbo" | tee -a /etc/vsftpd.userlist

RUN service vsftpd stop

ENTRYPOINT [ "/usr/sbin/vsftpd"]