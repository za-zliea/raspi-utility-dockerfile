#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

V2RAY_VERSION=v4.27.5

BUILD_ARG="${BUILD_ARG} --build-arg V2RAY_VERSION=${V2RAY_VERSION}"

docker build ${BUILD_ARG} -t ${REGISTRY}/v2ray:${V2RAY_VERSION} .
