#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

ARIANG_VERSION=1.1.6
BUILD_ARG="${BUILD_ARG} --build-arg ARIANG_VERSION=${ARIANG_VERSION}"

docker build ${BUILD_ARG} -t ${REGISTRY}/aria-ng:${ARIANG_VERSION} .
