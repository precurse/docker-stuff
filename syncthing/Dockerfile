FROM alpine:3.6
LABEL maintainer "andrewklaus@gmail.com"
ENV REFRESHED_AT 2017-09-18

RUN adduser -D -h /var/syncthing -s /nologin syncthing

ARG VERSION=local
ENV VERSION=${VERSION}

RUN apk update \
 && apk add --no-cache curl \
 && mkdir -p /syncthing /data \
 && chown -R syncthing:syncthing /var/syncthing /data \
 && cd /syncthing \
 && curl -s -L https://github.com/syncthing/syncthing/releases/download/v${VERSION}/syncthing-linux-amd64-v${VERSION}.tar.gz \
 | tar -zxf - \
 && mv syncthing-linux-amd64-v${VERSION}/syncthing /syncthing/syncthing \
 && chown -R syncthing /syncthing \
 && rm -rf syncthing-linux-amd64-v${VERSION} \
 && apk del curl

EXPOSE 8384 22000 21027/udp

USER syncthing

# Create vols
VOLUME /var/syncthing /data

# Disable default folder
ENV STNODEFAULTFOLDER=1

ENTRYPOINT ["/syncthing/syncthing"]
CMD ["-home", "/var/syncthing", "-gui-address", "0.0.0.0:8384", "-no-browser"]
