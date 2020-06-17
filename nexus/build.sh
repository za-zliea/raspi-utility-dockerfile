#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

NEXUS_VERSION=3.24.0-02
NEXUS_DOWNLOAD_SHA256_HASH=a2bfbc602228adeeb1a932e6e79bebea0ca2a9c1e7c86dfeeb3898aebf31f70c

BUILD_ARG="${BUILD_ARG} --build-arg NEXUS_VERSION=${NEXUS_VERSION} --build-arg NEXUS_DOWNLOAD_SHA256_HASH=${NEXUS_DOWNLOAD_SHA256_HASH}"

docker build ${BUILD_ARG} -t ${REGISTRY}/nexus:${NEXUS_VERSION} .
