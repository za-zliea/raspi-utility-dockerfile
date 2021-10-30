#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

NGINX_VERSION=1.20.1
BUILD_ARG="${BUILD_ARG} --build-arg NGINX_VERSION=${NGINX_VERSION}"

docker build ${BUILD_ARG} -t ${REGISTRY}/nginx:${NGINX_VERSION} .
