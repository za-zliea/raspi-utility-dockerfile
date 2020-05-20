#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

ARIA2_VERSION=1.35.0
BUILD_ARG="${BUILD_ARG} --build-arg ARIA2_VERSION=${ARIA2_VERSION}"

docker build ${BUILD_ARG} -t ${REGISTRY}/aria2:${ARIA2_VERSION} .
