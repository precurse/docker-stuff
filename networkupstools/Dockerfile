ARG BASE_IMAGE=alpine:3.6
FROM ${BASE_IMAGE}

LABEL maintainer "andrewklaus@gmail.com"
ENV REFRESHED_AT 2017-09-18

RUN apk add --no-cache \
    python \
    perl \
    autoconf \
    automake \
    libtool \
    build-base \
    gcc \
    abuild \
    binutils \
    binutils-doc \
    gcc-doc \
    libusb-compat-dev \
    cppunit-dev \
    neon-dev \
    net-snmp-dev \
    asciidoc \
    curl

RUN adduser -D nut

ENV release=2.7.4
RUN curl -s -L https://codeload.github.com/networkupstools/nut/tar.gz/v${release} \
  | tar -C / -zxvf - \
 && cd /nut-${release} \
 && ./autogen.sh && \
    ./configure \
    --without-wrap \
    --with-user=nut \
    --with-group=nut \
    --disable-static \
    --with-serial \
    --with-usb \
    --without-avahi \
    --with-snmp \
    --with-neon \
    --without-powerman \
    --without-ipmi \
    --without-freeipmi \
    --with-libltdl \
    --without-cgi \
    --prefix=/usr \
    --datadir=/usr/share/ups \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/ups \
    --with-openssl \
    --with-dev \
 && make \
 && make install \
 && cd / \
 && rm -rf /usr/share/man \
 && rm -rf /nut-${release} \
 && apk del \
    autoconf \
    automake \
    libtool \
    build-base \
    gcc \
    abuild \
    binutils \
    binutils-doc \
    gcc-doc \
    cppunit-dev \
    neon-dev \
    net-snmp-dev \
    asciidoc \
    curl

ADD start.sh /start.sh
RUN chmod +x /start.sh

ADD nut.conf /etc/ups/
ADD ups.conf /etc/ups/
ADD upsd.conf /etc/ups/
ADD upsd.users /etc/ups/

RUN chmod +x /start.sh \
 && mkdir -p /var/state/ups \
 && chown nut /var/state/ups /etc/ups

EXPOSE 3493

ENTRYPOINT ["/start.sh"]
