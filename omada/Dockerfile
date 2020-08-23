FROM ubuntu:16.04
ARG URL

WORKDIR /tmp

RUN apt update && \
    apt install -y \
      openjdk-8-jre-headless \
      jsvc \
      curl \
      mongodb \
      net-tools && \
    curl ${URL} | tar zxvf - && \
    cd Omada* && \
    rm -rf jre bin/mongod && \
    ln -s /usr/lib/jvm/java-8-openjdk-armhf /usr/lib/jvm/default-java && \
    ln -fs /usr/bin/mongod bin/mongod && \
    sed -i -e 's/JRE_HOME="${OMADA_HOME}\/jre"/JRE_HOME="\/usr\/lib\/jvm\/default-java"/g' bin/control.sh && \
    sed -i -e 's/JAVA_OPTS="-server/JAVA_OPTS="-client/g' bin/control.sh && \
    sed -i '/MAIN_CLASS=/a JSVC_OPTS="${JSVC_OPTS} -nodetach"' bin/control.sh && \
    sed -i 's/\${link_name} start$//' install.sh && \
    yes y | /bin/bash install.sh && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /opt/tplink/EAPController/data && \
    rm -rf /opt/tplink/EAPController/logs && \
    ln -sf /data /opt/tplink/EAPController/ && \
    ln -sf /logs /opt/tplink/EAPController/

COPY start.sh /start.sh
RUN chmod a+x /start.sh

WORKDIR /

EXPOSE 8088/tcp
EXPOSE 8043/tcp

VOLUME ["/data","/logs"]

ENTRYPOINT ["/start.sh"]
