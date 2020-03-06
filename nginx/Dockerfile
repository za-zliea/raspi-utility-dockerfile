ARG registry
ARG ubuntu_code_name

FROM ${registry}/ubuntu:${ubuntu_code_name}

ARG NGINX_INSTALL_DEPS="curl lsb-release gnupg2"
ARG NGINX_RUNTIME_DEPS="zlib1g openssl libpcre3 nginx ca-certificates"

RUN apt-get update \
 && apt-get install --no-install-recommends -y ${NGINX_INSTALL_DEPS} \
 && echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list \
 && curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add - \
 && apt-get update \
 && apt-get install -y ${NGINX_RUNTIME_DEPS} \
 && apt-get purge -y --auto-remove ${NGINX_INSTALL_DEPS} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -Rf /etc/nginx/conf.d/* \
 && mkdir -p /var/www/html /var/log/nginx \
 && chown -R nginx:www-data /var/www/html \
 && cp -r /usr/share/nginx/html/* /var/www/html

ADD conf /etc/nginx

WORKDIR /etc/nginx/conf.d

CMD ["nginx"]
