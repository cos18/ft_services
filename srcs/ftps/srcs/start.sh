#!/bin/bash

mkdir -p /var/ftp
mkdir -p /etc/ssl/private
mkdir -p /etc/ssl/certs
mkdir -p /var/ftp/user

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KR/ST=Seoul/L=Gangdonggu/O=Godeokro/CN=127.0.0.1"	-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

adduser -D user -h /var/ftp/user
chown user:user /var/ftp/user
echo "user:passwd" | chpasswd

vsftpd /etc/vsftpd/vsftpd.conf
