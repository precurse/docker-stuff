ARG BASE_IMAGE=alpine:3.7
FROM ${BASE_IMAGE}

LABEL maintainer "andrewklaus@gmail.com"
ENV REFRESHED_AT 2017-09-18

ADD VERSION /VERSION
RUN apk add --no-cache \
    nginx \
    curl \
 && adduser -D -u 1000 -g 'www' www \
 && mkdir -p /www/smartos

RUN export VERSION=`cat /VERSION` \
  && curl -s -L http://us-east.manta.joyent.com/Joyent_Dev/public/SmartOS/${VERSION}/platform-${VERSION}.tgz \
  | tar -C /www -zxvf - \
 && mv /www/platform-${VERSION} /www/smartos/platform

ADD nginx.conf /nginx.conf

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["-c","/nginx.conf"]
