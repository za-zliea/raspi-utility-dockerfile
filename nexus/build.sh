#!/bin/bash

source ./../env.sh

cd "$(dirname "$0")"

NEXUS_VERSION=3.23.0

docker build ${BUILD_ARG} -t ${REGISTRY}/nexus:${NEXUS_VERSION} .
