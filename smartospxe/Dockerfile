FROM precurse/alpine-armhf
LABEL maintainer "andrewklaus@gmail.com"

RUN apk update && \
    apk add nginx=1.10.3-r0 && \
    adduser -D -u 1000 -g 'www' www

ENV release=20170601T212107Z
RUN curl -s -L https://us-east.manta.joyent.com/Joyent_Dev/public/builds/smartos/release-20170525-20170601T212107Z/smartos//platform-${release}.tgz \
  | tar -C /www -zxvf - \
 && mv /www/platform*/* /www/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["-c","/nginx.conf"]
