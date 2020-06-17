#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

PROXY=http://172.16.1.200:8118/

BUILD_ARG="${BUILD_ARG} --build-arg PROXY=${PROXY}"

docker build ${BUILD_ARG} -t ${REGISTRY}/ddns:latest .
