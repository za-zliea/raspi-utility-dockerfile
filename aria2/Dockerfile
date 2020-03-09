ARG registry=registry
ARG ubuntu_code_name=bionic

FROM ${registry}/ubuntu:${ubuntu_code_name}

ENV ARIA2_VERSION=1.35.0
ARG ARIA2_BUILD_DEPS="git libcppunit-dev autoconf automake autotools-dev autopoint libtool pkg-config libssl-dev libssh2-1-dev libc-ares-dev libexpat1-dev libsqlite3-dev zlib1g-dev"
ARG ARIA2_RUNTIME_DEPS="curl"
ARG ARIA2_SOURCE_URL="https://github.com/aria2/aria2.git"
ARG ARIA2_BUILD_DIR="/tmp/aria2"

ENV ARIA2_CONFIG_DIR=/etc/aria2
ENV ARIA2_DOWNLOAD_DIR=/opt/download

ENV RPC_SECRET=
ENV ARIA2_BT_TRACKER_URL=

RUN apt-get update \
 && apt-get install -y ${ARIA2_BUILD_DEPS} \
 && git clone -b release-${ARIA2_VERSION} ${ARIA2_SOURCE_URL} ${ARIA2_BUILD_DIR}  \
 && cd ${ARIA2_BUILD_DIR} \
 && autoreconf -i \
 && ./configure ARIA2_STATIC=yes --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt' \
 && make \
 && make install \
 && mkdir -p ${ARIA2_CONFIG_DIR} ${ARIA2_DOWNLOAD_DIR} \
 && rm -Rf ${ARIA2_BUILD_DIR} \
 && apt-get purge -y --auto-remove ${ARIA2_BUILD_DEPS} \
 && apt-get install --no-install-recommends -y ${ARIA2_RUNTIME_DEPS} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR ${ARIA2_CONFIG_DIR}

COPY conf/aria2 /etc/aria2
COPY conf/.aria2 /etc/.aria2
COPY script /usr/local/bin
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6800

CMD ["aria2c", "--conf-path", "/etc/aria2/aria2.conf"]
