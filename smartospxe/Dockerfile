FROM precurse/alpine-armhf
LABEL maintainer "andrewklaus@gmail.com"

RUN apk update && \
    apk add --no-cache \
    nginx=1.12.0-r2 \
    curl \
 && adduser -D -u 1000 -g 'www' www \
 && mkdir -p /www/smartos

ENV release=20170601T212107Z
RUN curl -s -L http://us-east.manta.joyent.com/Joyent_Dev/public/SmartOS/${release}/platform-${release}.tgz \
  | tar -C /www -zxvf - \
 && mv /www/platform-${release} /www/smartos/platform

ADD nginx.conf /nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["-c","/nginx.conf"]
