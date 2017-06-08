FROM precurse/alpine-armhf
LABEL maintainer "andrewklaus@gmail.com"

RUN apk update && \
    apk add nginx=1.10.3-r0 && \
    adduser -D -u 1000 -g 'www' www

ADD platform-20170413T062226Z.tgz /www
#RUN tar xvf /platform.tgz /www
RUN mv /www/platform*/* /www/
ADD nginx.conf /nginx.conf


ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["-c","/nginx.conf"]
