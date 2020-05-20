#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

VLMCSD_VERSION="svn1113"

BUILD_ARG="${BUILD_ARG} --build-arg VLMCSD_VERSION=${VLMCSD_VERSION}"

docker build ${BUILD_ARG} -t ${REGISTRY}/vlmcsd:${VLMCSD_VERSION} .
