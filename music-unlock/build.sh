#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

MUSIC_UNLOCK_VERSION=v1.9.1
BUILD_ARG="${BUILD_ARG} --build-arg MUSIC_UNLOCK_VERSION=${MUSIC_UNLOCK_VERSION}"

docker build ${BUILD_ARG} -t ${REGISTRY}/music-unlock:${MUSIC_UNLOCK_VERSION} .
