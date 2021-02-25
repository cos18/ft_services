FROM        alpine:3.12.0

RUN         apk --update --no-cache add bash vsftpd openssl

ARG         PASV=${pasv_address}

ENV         PASV_ENABLE=YES \
  PASV_MIN_PORT=20000 \
  PASV_MAX_PORT=20003 \
  NODE_ADDRESS=${PASV}

COPY        /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY        /srcs/start.sh /

EXPOSE      20 21 20000-20004
ENTRYPOINT  ["sh", "start.sh"]
