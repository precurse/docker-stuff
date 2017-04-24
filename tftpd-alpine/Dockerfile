FROM precurse/alpine-armhf
LABEL maintainer "andrewklaus@gmail.com"

RUN apk update && \
    apk add tftp-hpa

ADD ./syslinux-6.03.tar.xz /
#RUN tar xvf /syslinux-6.03.tar.xz

RUN cp /syslinux-6.03/bios/com32/lib/libcom32.c32 /var/tftpboot/ && \
    cp /syslinux-6.03/bios/com32/elflink/ldlinux/ldlinux.c32 /var/tftpboot/ && \
    cp /syslinux-6.03/bios/core/lpxelinux.0 /var/tftpboot/pxelinux.0 && \
    mkdir /var/tftpboot/pxelinux.cfg

ADD pxelinux_default.cfg /var/tftpboot/pxelinux.cfg/default

EXPOSE 69/udp

RUN adduser -D tftpd

ENTRYPOINT ["in.tftpd"]
CMD ["--foreground","--verbose","--user","tftpd","--secure","/var/tftpboot"]
