ARG registry=registry
ARG ubuntu_code_name=bionic

FROM ${registry}/ubuntu:${ubuntu_code_name}

ENV ARGS=

ARG BUILD_DEPS="git build-essential" 

ARG VLMCSD_VERSION="svn1112"
ARG VLMCSD_BUILD_DIR="/tmp/vlmcsd"
ARG VLMCSD_GIT_URL="https://github.com/Wind4/vlmcsd.git"

RUN apt-get update \
 && apt-get install --no-install-recommends -y ${BUILD_DEPS} \
 && git clone -b ${VLMCSD_VERSION} ${VLMCSD_GIT_URL} ${VLMCSD_BUILD_DIR} \
 && cd ${VLMCSD_BUILD_DIR} \
 && make \
 && cp bin/vlmcsd /usr/bin \
 && rm -Rf ${VLMCSD_BUILD_DIR} \
 && apt-get purge -y --auto-remove ${BUILD_DEPS} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 1688

CMD ["vlmcsd", "-D", "-e", "-t", "3", "-v"]
