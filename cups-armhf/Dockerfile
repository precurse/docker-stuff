FROM precurse/alpine-armhf:3.6.2
LABEL maintainer "andrewklaus@gmail.com"

RUN adduser -D -h /var/syncthing -s /nologin cups

ARG VERSION=local
ENV VERSION=${VERSION}

RUN apk update \
 && apk add --no-cache curl \
 && cd /cups \
 && curl -s -L https://github.com/apple/cups/releases/download/v${VERSION}/cups-${VERSION}-source.tar.gz \
 | tar -zxf - \
 && cd cups-${VERSION} \
 && ./configure && make && make install
 && apk del curl

EXPOSE 8384 22000 21027/udp

USER syncthing

# Create vols
VOLUME /var/syncthing /data

# Disable Syncthing auto-upgrade
ENV STNOUPGRADE=1
# Disable default folder
ENV STNODEFAULTFOLDER=1

ENTRYPOINT ["/syncthing/syncthing"]
CMD ["-home", "/var/syncthing", "-gui-address", "0.0.0.0:8384", "-no-browser"]
