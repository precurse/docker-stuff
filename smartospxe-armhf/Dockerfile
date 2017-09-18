FROM precurse/alpine-armhf:3.6.2
LABEL maintainer "andrewklaus@gmail.com"
ENV REFRESHED_AT 2017-09-18

RUN apk update && \
    apk add --no-cache \
    nginx \
    curl \
 && adduser -D -u 1000 -g 'www' www \
 && mkdir -p /www/smartos

ARG VERSION=local
ENV VERSION ${VERSION}
RUN curl -s -L http://us-east.manta.joyent.com/Joyent_Dev/public/SmartOS/${VERSION}/platform-${VERSION}.tgz \
  | tar -C /www -zxvf - \
 && mv /www/platform-${VERSION} /www/smartos/platform

ADD nginx.conf /nginx.conf

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["-c","/nginx.conf"]
