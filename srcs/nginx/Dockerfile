FROM        alpine

RUN         apk add nginx openssh openssl
RUN         echo "root:ftservice" | chpasswd

RUN		      ssh-keygen -A

COPY	      /srcs/sshd_config /etc/ssh/
COPY	      /srcs/nginx.conf /etc/nginx/
COPY	      /srcs/ssl_params.conf /etc/nginx/
COPY	      /srcs/index.html /var/www/
COPY	      /srcs/start.sh /

COPY        srcs/init.sh ./root/
RUN         sh ./root/init.sh

EXPOSE      80 443 22
ENTRYPOINT  ["sh", "start.sh"]
