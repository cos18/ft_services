FROM        alpine:3.12

RUN         apk update
RUN         apk --update --no-cache add nginx openssh-server openssl
RUN         mkdir -p /run/nginx; mkdir -p /var/www

RUN         echo "root:ftservice" | chpasswd
RUN         openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KR/ST=Seoul/L=Gangdonggu/O=Godeokro/CN=127.0.0.1" -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt
RUN         openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048
RUN		      ssh-keygen -A

COPY	      /srcs/sshd_config /etc/ssh/
COPY	      /srcs/default.conf /etc/nginx/conf.d/
COPY	      /srcs/index.html /var/www/
COPY	      /srcs/start.sh /

EXPOSE      80 443 22
ENTRYPOINT  ["sh", "start.sh"]
