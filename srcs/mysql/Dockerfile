FROM        alpine:3.12

RUN         apk --update --no-cache add mysql mysql-client

COPY        /srcs/my.cnf /etc/my.cnf
RUN         chmod 644 /etc/my.cnf
COPY        /srcs/mysql.sql /mysql.sql
COPY        /srcs/start.sh /usr/sbin/start.sh
RUN         chmod 777 /usr/sbin/start.sh

EXPOSE      3306
ENTRYPOINT  ["/usr/sbin/start.sh"]
