ARG registry=registry
ARG ubuntu_code_name=bionic

FROM ${registry}/ubuntu:${ubuntu_code_name}

ARG CRON_INSTALL_PKG="curl cron vim" 
ENV CRON_CONF=/etc/cron.d
ENV CRON_LOG=/var/log/cron.d
ENV PROXY=

RUN apt-get update \
 && apt-get install --no-install-recommends -y ${CRON_INSTALL_PKG} \
 && mkdir ${CRON_LOG} \
 && sed -i 's|SHELL=/bin/sh|SHELL=/bin/bash|g' /etc/crontab \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY script/* /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["cron", "-f"]
