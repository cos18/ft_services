FROM        alpine:3.12

RUN         apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN         apk add influxdb

COPY        /srcs/telegraf.conf /etc/telegraf/
COPY        /srcs/influxdb.conf /etc
COPY        /srcs/start.sh /

EXPOSE      8086
ENTRYPOINT  ["sh", "start.sh"]
