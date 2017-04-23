FROM alpine:3.5

ADD ./v2.7.4.tar.gz /
#RUN tar xvf /nut.tar.gz

WORKDIR /nut-2.7.4

RUN apk update && \
    apk add python perl autoconf automake libtool build-base gcc abuild binutils binutils-doc gcc-doc libusb-compat-dev cppunit-dev neon-dev net-snmp-dev asciidoc

RUN adduser -D nut

RUN ./autogen.sh && \
    ./configure \
    --without-wrap \
    --with-user=nut \
    --with-group=nut \
    --disable-static \
    --with-serial \
    --with-usb \
    --with-doc="" \
    --without-avahi \
    --with-snmp \
    --with-neon \
    --without-powerman \
    --without-ipmi \
    --without-freeipmi \
    --with-libltdl \
    --without-cgi \
    --prefix=/usr \
    --with-udev-dir=/usr/lib/udev \
    --datadir=/usr/share/ups \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/ups \
    --with-openssl \
    --with-dev

RUN make
RUN make install && rm -rf /usr/share/man/
RUN mkdir -p /var/state/ups && chown nut /var/state/ups /etc/ups

USER nut

ADD nut.conf /etc/ups/
ADD ups.conf /etc/ups/
ADD upsd.conf /etc/ups/
ADD upsd.users /etc/ups/


EXPOSE 3493

ENTRYPOINT ["/usr/bin/upsd"]
CMD ["-D"]
