FROM        alpine

RUN         apk add nginx openssh
RUN         echo "root:ftservice" | chpasswd

COPY        srcs/init.sh ./root/
RUN         sh ./root/init.sh

# EXPOSE      80 443 22
# ENTRYPOINT  ["sh", "start.sh"]
