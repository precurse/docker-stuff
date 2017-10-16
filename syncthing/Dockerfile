FROM alpine:3.6
LABEL maintainer "andrewklaus@gmail.com"
ENV REFRESHED_AT 2017-09-18

RUN adduser -D -h /var/syncthing -s /nologin syncthing

ARG VERSION=local
ENV VERSION=${VERSION}

RUN apk add --no-cache curl gnupg \
 && mkdir -p /syncthing /data \
 && chown -R syncthing:syncthing /var/syncthing /data \
 && cd /syncthing \
 && curl -sLO https://github.com/syncthing/syncthing/releases/download/v${VERSION}/syncthing-linux-amd64-v${VERSION}.tar.gz \
 && curl -sLO https://github.com/syncthing/syncthing/releases/download/v${VERSION}/sha1sum.txt.asc \
 && grep syncthing-linux-amd64-v${VERSION} sha1sum.txt.asc | sha1sum \
 && gpg --keyserver pgp.mit.edu --recv-key D26E6ED000654A3E \
 && gpg --verify sha1sum.txt.asc \
 && tar -zxf syncthing-linux-amd64-v${VERSION}.tar.gz \
 && mv syncthing-linux-amd64-v${VERSION}/syncthing /syncthing/syncthing \
 && chown -R syncthing /syncthing \
 && rm -rf syncthing-linux-amd64-v${VERSION} \
 && rm -rf /root/.gnupg \
 && rm syncthing-linux-amd64-v${VERSION}.tar.gz \
 && rm sha1sum.txt.asc \
 && apk del curl gnupg

EXPOSE 8384 22000 21027/udp

USER syncthing

# Create vols
VOLUME /var/syncthing /data

# Disable default folder
ENV STNODEFAULTFOLDER=1

ENTRYPOINT ["/syncthing/syncthing"]
CMD ["-home", "/var/syncthing", "-gui-address", "0.0.0.0:8384", "-no-browser"]
