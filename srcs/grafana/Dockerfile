FROM        alpine:3.12

RUN         apk --update --no-cache add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted

COPY	      /srcs/start.sh /

EXPOSE      3000
ENTRYPOINT  ["sh", "start.sh"]
