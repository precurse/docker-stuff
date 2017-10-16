FROM alpine:3.6
LABEL maintainer "andrewklaus@gmail.com"
ENV REFRESHED_AT 2017-09-18

ARG VERSION=local
ENV VERSION=${VERSION}
ENV ARCH=amd64

WORKDIR /

RUN apk add --no-cache curl gnupg \
 && curl -sLO https://github.com/syncthing/syncthing/releases/download/v${VERSION}/syncthing-linux-${ARCH}-v${VERSION}.tar.gz \
 && curl -sLO https://github.com/syncthing/syncthing/releases/download/v${VERSION}/sha1sum.txt.asc \
 && grep syncthing-linux-${ARCH} sha1sum.txt.asc | sha1sum \
 && gpg --keyserver keyserver.ubuntu.com --recv-key D26E6ED000654A3E \
 && gpg --verify sha1sum.txt.asc \
 && tar -zxf syncthing-linux-${ARCH}-v${VERSION}.tar.gz \
 && mv syncthing-linux-${ARCH}-v${VERSION}/syncthing /syncthing


FROM alpine:3.6
RUN apk --no-cache add ca-certificates
WORKDIR /

RUN mkdir -p /syncthing /data \
  && adduser -D -h /var/syncthing -s /nologin syncthing \
  && chown -R syncthing:syncthing /var/syncthing /data \
  && chown syncthing /syncthing

COPY --from=0 /syncthing .

EXPOSE 8384 22000 21027/udp

USER syncthing

# Create vols
VOLUME /var/syncthing /data

# Disable default folder
ENV STNODEFAULTFOLDER=1

ENTRYPOINT ["/syncthing"]
CMD ["-home", "/var/syncthing", "-gui-address", "0.0.0.0:8384", "-no-browser"]
