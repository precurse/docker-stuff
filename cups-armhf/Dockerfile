FROM precurse/alpine-armhf:3.6.2
LABEL maintainer "andrewklaus@gmail.com"

ARG VERSION=local
ENV VERSION=${VERSION}

RUN apk update && \
    apk add --no-cache cups

EXPOSE 631

ENTRYPOINT ["/usr/sbin/cupsd"]
#CMD ["-home", "/var/syncthing", "-gui-address", "0.0.0.0:8384", "-no-browser"]
