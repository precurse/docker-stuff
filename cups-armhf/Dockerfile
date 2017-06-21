FROM precurse/alpine-armhf:3.6.2
LABEL maintainer "andrewklaus@gmail.com"

RUN adduser -D -h /var/cups -s /nologin cups

ARG VERSION=local
ENV VERSION=${VERSION}

RUN apk update && \
    apk add --no-cache \
    autoconf \
    automake \
    libtool \
    build-base \
    linux-headers \
    gcc \
    gcc-doc \
    zlib-dev \
    curl

RUN mkdir /cups \
 && cd /cups \
 && curl -s -L https://github.com/apple/cups/releases/download/v${VERSION}/cups-${VERSION}-source.tar.gz \
 | tar -zxf - \
 && cd cups-${VERSION} \
 && ./configure && make && make install \
 && apk del curl

EXPOSE 631

ENTRYPOINT ["/usr/sbin/cupsd"]
#CMD ["-home", "/var/syncthing", "-gui-address", "0.0.0.0:8384", "-no-browser"]
