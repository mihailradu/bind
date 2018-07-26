FROM ubuntu:18.04

LABEL description="Simple BIND DNS service"
LABEL version="1.0"
LABEL maintainer="mradu@live.com"

ENV BIND_USER=bind \
    DATA_DIR=/data

RUN apt-get update && \
    apt-get -y install bind9 && \
    mkdir /data

COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 53/udp 53/tcp 

ENTRYPOINT ["/sbin/entrypoint.sh"]
