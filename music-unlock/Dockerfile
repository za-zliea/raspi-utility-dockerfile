ARG registry=registry
ARG ubuntu_code_name=bionic

FROM ${registry}/ubuntu:${ubuntu_code_name}

ARG MUSIC_UNLOCK_VERSION=

ARG MUSIC_UNLOCK_INSTALL_DEPS="curl"
ARG MUSIC_UNLOCK_DL_URL="https://github.com/ix64/unlock-music/releases/download/${MUSIC_UNLOCK_VERSION}/modern.tar.gz"
ARG MUSIC_UNLOCK_DL_PATH="/opt/music-unlock-${MUSIC_UNLOCK_VERSION}.zip"

ENV MUSIC_UNLOCK_BACKUP_DIR="/opt/.music-unlock-${MUSIC_UNLOCK_VERSION}"
ENV MUSIC_UNLOCK_ROOT_DIR="/opt/music-unlock-${MUSIC_UNLOCK_VERSION}"

ENV MUSIC_UNLOCK_VERSION=${MUSIC_UNLOCK_VERSION}

LABEL MUSIC_UNLOCK_VERSION=${MUSIC_UNLOCK_VERSION}

RUN apt-get update \
 && apt-get install -y ${MUSIC_UNLOCK_INSTALL_DEPS} \
 && curl -fsSL ${MUSIC_UNLOCK_DL_URL} -o ${MUSIC_UNLOCK_DL_PATH} \
 && cd /opt \
 && mkdir ${MUSIC_UNLOCK_ROOT_DIR} \
 && tar -zxvf ${MUSIC_UNLOCK_DL_PATH} -C ${MUSIC_UNLOCK_ROOT_DIR} \
 && echo "${MUSIC_UNLOCK_VERSION}" > ${MUSIC_UNLOCK_ROOT_DIR}/.music-unlock.version \
 && cp -r ${MUSIC_UNLOCK_ROOT_DIR} ${MUSIC_UNLOCK_BACKUP_DIR} \
 && rm -Rf ${MUSIC_UNLOCK_DL_PATH} \
 && apt-get purge -y --auto-remove ${MUSIC_UNLOCK_INSTALL_DEPS} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR ${MUSIC_UNLOCK_ROOT_DIR}

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["music-unlock-init"]
