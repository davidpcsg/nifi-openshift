FROM registry.access.redhat.com/ubi8/openjdk-11:latest

#ARG NIFI_VERSION=1.15.2
#ARG BASE_URL=https://archive.apache.org/dist
#ARG MIRROR_BASE_URL=${MIRROR_BASE_URL:-${BASE_URL}}
#ARG NIFI_BINARY_PATH=${NIFI_BINARY_PATH:-/nifi/${NIFI_VERSION}/nifi-${NIFI_VERSION}-bin.zip}
#ARG NIFI_TOOLKIT_BINARY_PATH=${NIFI_TOOLKIT_BINARY_PATH:-/nifi/${NIFI_VERSION}/nifi-toolkit-${NIFI_VERSION}-bin.zip}
#ARG MYSQL_DRIVER=mysql-connector-java-8.0.16
#ARG MYSQL_DRIVER_URL=https://dev.mysql.com/get/Downloads/Connector-J/${MYSQL_DRIVER}.zip
#ARG POSTGRESQL_DRIVER=postgresql-42.3.1
#ARG POSTGRESQL_DRIVER_URL=https://jdbc.postgresql.org/download/${POSTGRESQL_DRIVER}.jar

#ENV NIFI_BASE_DIR=/opt/nifi
#ENV NIFI_HOME ${NIFI_BASE_DIR}/nifi-current
#ENV NIFI_TOOLKIT_HOME ${NIFI_BASE_DIR}/nifi-toolkit-current

#ENV NIFI_PID_DIR=${NIFI_HOME}/run
#ENV NIFI_LOG_DIR=${NIFI_HOME}/conf/logs

# Setup NiFi user and create necessary directories
#RUN mkdir -p ${NIFI_BASE_DIR}

# Download, validate, and expand Apache NiFi binary.
#RUN curl -fSL ${MIRROR_BASE_URL}/${NIFI_BINARY_PATH} -o ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}-bin.zip \
    && echo "$(curl ${BASE_URL}/${NIFI_BINARY_PATH}.sha256) *${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}-bin.zip" | sha256sum -c - \
    && unzip ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}-bin.zip -d ${NIFI_BASE_DIR} \
    && rm ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}-bin.zip \
    && mv ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION} ${NIFI_HOME}

#RUN mkdir ${NIFI_PID_DIR}
#RUN mkdir ${NIFI_LOG_DIR}

#RUN chgrp -R 0 ${NIFI_HOME} && \
    chmod -R g=u ${NIFI_HOME} 

#EXPOSE 8080 8443 10000 8000

#WORKDIR ${NIFI_HOME}

#ENTRYPOINT ["sh", "-c", "${NIFI_HOME}/bin/nifi.sh run"]

ENTRYPOINT ["sleep", "100000000"]
