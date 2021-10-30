ARG registry=registry
ARG ubuntu_code_name=bionic

FROM ${registry}/ubuntu:${ubuntu_code_name}

ARG BUILD_DEPS="git gettext build-essential autoconf libtool libpcre3-dev libssl-dev asciidoc xmlto libev-dev libc-ares-dev automake libmbedtls-dev libsodium-dev libbloom-dev libmbedcrypto3"
ARG RUNTIME_DEPS="apg libev4 libsodium23 libbloom1 libmbedcrypto3 libcap2 libcap2-bin libcork16 libcorkipset1 libpam-cap haveged kcptun"

ARG SHADOWSOCKS_VERSION=
ARG SHADOWSOCKS_BUILD_DIR="/tmp/shadowsocks-libev"
ARG SHADOWSOCKS_GIT_URL="https://github.com/shadowsocks/shadowsocks-libev.git"

ARG SIMPLE_OBFS_VERSION=
ARG SIMPLE_OBFS_BUILD_DIR="/tmp/simple-obfs"
ARG SIMPLE_OBFS_GIT_URL="https://github.com/shadowsocks/simple-obfs.git"

LABEL SHADOWSOCKS_VERSION=${SHADOWSOCKS_VERSION}

RUN apt-get update \
 && apt-get install --no-install-recommends -y ${BUILD_DEPS} rng-tools \
 && git clone -b ${SHADOWSOCKS_VERSION} ${SHADOWSOCKS_GIT_URL} ${SHADOWSOCKS_BUILD_DIR} \
 && cd ${SHADOWSOCKS_BUILD_DIR} \
 && git submodule update --init --recursive \
 && ./autogen.sh \
 && ./configure --prefix=/usr --disable-documentation \
 && make \
 && make install \
 && git clone -b ${SIMPLE_OBFS_VERSION} ${SIMPLE_OBFS_GIT_URL} ${SIMPLE_OBFS_BUILD_DIR} \
 && cd ${SIMPLE_OBFS_BUILD_DIR} \
 && git submodule update --init --recursive \
 && sed -i "s/if (strncasecmp(hostname, obfs_http->host, result) == 0)/if (strncasecmp(hostname, obfs_http->host, len) == 0)/g" src/obfs_http.c \
 && sed -i "s/strncpy(interface.ifr_name, interface_name, IFNAMSIZ);/strncpy(interface.ifr_name, interface_name, IFNAMSIZ - 1);\n    interface.ifr_name[IFNAMSIZ - 1] = '\\\0';/g" src/netutils.c \
 && ./autogen.sh \
 && ./configure --prefix=/usr --disable-documentation \
 && make \
 && make install \
 && rm -Rf ${SHADOWSOCKS_BUILD_DIR} ${SIMPLE_OBFS_BUILD_DIR} \
 && apt-get purge -y --auto-remove ${BUILD_DEPS} \
 && apt-get install --no-install-recommends -y ${RUNTIME_DEPS} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG SHADOWSOCKS_CONFIG_DIR="/etc"

COPY conf/shadowsocks-libev ${SHADOWSOCKS_CONFIG_DIR}/shadowsocks-libev
COPY conf/.shadowsocks-libev ${SHADOWSOCKS_CONFIG_DIR}/.shadowsocks-libev

WORKDIR /etc/shadowsocks-libev

CMD ["ss-local", "-b", "0.0.0.0", "${ARGS}","-c", "/etc/shadowsocks-libev/config.json"]
