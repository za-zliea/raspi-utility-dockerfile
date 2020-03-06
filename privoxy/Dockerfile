ARG registry=registry
ARG ubuntu_code_name=bionic

FROM ${registry}/ubuntu:${ubuntu_code_name}

RUN apt-get update \
 && apt-get install --no-install-recommends -y privoxy \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /etc/.privoxy \
 && cp -r /etc/privoxy/* /etc/.privoxy \
 && sed -i -e '/^listen-address/s/127.0.0.1/0.0.0.0/' \
    -e 's/^listen-address  \[::1\]:8118/#listen-address  \[::1\]:8118/g' \
    -e '/^accept-intercepted-requests/s/0/1/' \
    -e '/^enforce-blocks/s/0/1/' \
    -e 's/#       forward           localhost\/     \./forward-socks5   \/               127.0.0.1:8118 \./g' /etc/privoxy/config

WORKDIR /etc/privoxy

CMD ["privoxy", "--no-daemon", "/etc/privoxy/config"]
