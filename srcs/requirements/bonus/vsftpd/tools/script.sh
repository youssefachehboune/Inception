adduser ${FTP_USER} --gecos "" --disabled-password
echo "${FTP_USER}:${FTP_PASS}" | chpasswd

/usr/sbin/vsftpd