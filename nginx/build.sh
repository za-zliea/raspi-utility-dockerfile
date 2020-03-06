#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

NGINX_VERSION=1.16

docker build ${BUILD_ARG} -t ${REGISTRY}/nginx:${NGINX_VERSION} .
