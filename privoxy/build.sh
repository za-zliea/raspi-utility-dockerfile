#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

PRIVOXY_VERSION=3.0.28

docker build ${BUILD_ARG} -t ${REGISTRY}/privoxy:${PRIVOXY_VERSION} .
