ARG ubuntu_code_name
FROM ubuntu:$ubuntu_code_name

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata locales ca-certificates --no-install-recommends \
 && echo "Asia/Shanghai" | tee /etc/timezone \
 && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && locale-gen en_US.UTF-8 \
 && rm -rf /var/lib/apt/lists/*

ENV LC_ALL en_US.UTF-8
