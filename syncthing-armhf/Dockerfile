FROM precurse/alpine-armhf:3.6.2
LABEL maintainer "andrewklaus@gmail.com"

RUN adduser -D -h /var/syncthing -s /nologin syncthing

ARG VERSION=local
ENV VERSION=${VERSION}

RUN apk update \
 && apk add --no-cache curl \
 && mkdir /syncthing \
 && cd /syncthing \
 && curl -s -L https://github.com/syncthing/syncthing/releases/download/v${VERSION}/syncthing-linux-arm-v${VERSION}.tar.gz \
 | tar -zxf - \
 && mv syncthing-linux-arm-v${VERSION}/syncthing /syncthing/syncthing \
 && rm -rf syncthing-linux-arm-v${VERSION} \
 && apk del curl

EXPOSE 22000
EXPOSE 21027/udp

USER syncthing

# Disable Syncthing auto-upgrade
ENV STNOUPGRADE=1
ENTRYPOINT ["/syncthing/syncthing"]
CMD ["-home", "/var/syncthing/config", "-gui-address", "0.0.0.0:8384"]
