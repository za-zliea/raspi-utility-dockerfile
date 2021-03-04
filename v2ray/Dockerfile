ARG registry=registry
ARG ubuntu_code_name=bionic

FROM ${registry}/ubuntu:${ubuntu_code_name}

ARG INSTALL_DEPS="curl unzip"

ARG V2RAY_VERSION=
ARG V2RAY_DL_URL=https://github.com/v2fly/v2ray-core/releases/download/${V2RAY_VERSION}/v2ray-linux-arm64-v8a.zip
ARG V2RAY_DIGEST_URL="${V2RAY_DL_URL}.dgst"
ARG V2RAY_DL_DIR="/tmp"
ARG V2RAY_FILE="${V2RAY_DL_DIR}/v2ray.zip"
ARG V2RAY_DIR="${V2RAY_DL_DIR}/v2ray"
ARG V2RAY_BINARY_DIR="/usr/bin/v2ray"
ARG V2RAY_CONFIG_DIR="/etc/v2ray"
ARG V2RAY_CONFIG_BACKUP_DIR="/etc/.v2ray"
ARG V2RAY_LOG_DIR="/var/log/v2ray"

LABEL V2RAY_VERSION=${V2RAY_VERSION}

RUN apt-get update \
 && apt-get install --no-install-recommends -y ${INSTALL_DEPS} \
 && curl -fsSL ${V2RAY_DL_URL} -o ${V2RAY_FILE} \
 && echo "$(curl -fsSL ${V2RAY_DIGEST_URL} | grep SHA512 | awk '{print $2}') ${V2RAY_FILE}" | sha512sum -c - \
 && mkdir ${V2RAY_DIR} ${V2RAY_BINARY_DIR} ${V2RAY_CONFIG_DIR} ${V2RAY_CONFIG_BACKUP_DIR} ${V2RAY_LOG_DIR} \
 && cd ${V2RAY_DIR} \
 && unzip ${V2RAY_FILE} \
 && mv -t ${V2RAY_BINARY_DIR} v2* *.dat \
 && mv -t ${V2RAY_CONFIG_DIR} *.json \
 && cp ${V2RAY_CONFIG_DIR}/* ${V2RAY_CONFIG_BACKUP_DIR} \
 && apt-get purge -y --auto-remove ${INSTALL_DEPS} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV PATH="$PATH:${V2RAY_BINARY_DIR}"

WORKDIR /etc/v2ray

CMD ["v2ray", "-config", "/etc/v2ray/config.json"]
