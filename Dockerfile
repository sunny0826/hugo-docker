FROM alpine

LABEL maintainer="sunnydog0826@gmail.com"

RUN echo "https://mirrors.aliyun.com/alpine/v3.9/main/" > /etc/apk/repositories \
    && apk update \
    && apk add --no-cache ca-certificates git \
    && rm -rf /var/cache/apk/*

COPY hugo /usr/local/bin/

COPY  run.sh /var/local/
