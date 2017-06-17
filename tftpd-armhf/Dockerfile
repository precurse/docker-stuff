FROM precurse/alpine-armhf
LABEL maintainer "andrewklaus@gmail.com"

RUN apk update && \
    apk add --no-cache tftp-hpa curl

ENV release=6.03
RUN curl -s -L https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-${release}.tar.xz \
  | tar -Jxvf - \
 && cp /syslinux-${release}/bios/com32/lib/libcom32.c32 /var/tftpboot/ \
 && cp /syslinux-${release}/bios/com32/mboot/mboot.c32 /var/tftpboot/ \
 && cp /syslinux-${release}/bios/com32/elflink/ldlinux/ldlinux.c32 /var/tftpboot/ \
 && cp /syslinux-${release}/bios/core/lpxelinux.0 /var/tftpboot/pxelinux.0  \
 && rm -rf /syslinux-${release} \
 && mkdir /var/tftpboot/pxelinux.cfg

ADD pxelinux_default.cfg /var/tftpboot/pxelinux.cfg/default

EXPOSE 69/udp

RUN adduser -D tftpd

ENTRYPOINT ["in.tftpd", "--foreground", "--verbose"]
CMD ["--user","tftpd","--secure","/var/tftpboot"]
