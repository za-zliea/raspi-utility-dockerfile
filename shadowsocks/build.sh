#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

SHADOWSOCKS_VERSION=v3.3.5
SIMPLE_OBFS_VERSION=v0.0.5

BUILD_ARG="${BUILD_ARG} --build-arg SHADOWSOCKS_VERSION=${SHADOWSOCKS_VERSION} --build-arg SIMPLE_OBFS_VERSION=${SIMPLE_OBFS_VERSION}" 

docker build ${BUILD_ARG} -t ${REGISTRY}/shadowsocks-libev:${SHADOWSOCKS_VERSION} .
