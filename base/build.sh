#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

docker build ${BUILD_ARG} -t ${REGISTRY}/ubuntu:${UBUNTU_CODE_NAME} .
