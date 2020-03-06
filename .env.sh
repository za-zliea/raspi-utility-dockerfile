#!/bin/bash

REGISTRY=
UBUNTU_CODE_NAME=bionic
NAMESPACE=

PROXY=
BUILD_ARG=

if [[ -n "${REGISTRY}" ]]; then
    BUILD_ARG="${BUILD_ARG} --build-arg registry=${REGISTRY}"
fi

if [[ -n "${NAMESPACE}" ]]; then
    BUILD_ARG="${BUILD_ARG} --build-arg namespace=${NAMESPACE}"
fi

if [[ -n "${PROXY}" ]]; then
    BUILD_ARG="${BUILD_ARG} --build-arg http_proxy=${PROXY} --build-arg https_proxy=${PROXY}"
fi

if [[ -n "${UBUNTU_CODE_NAME}" ]]; then
    BUILD_ARG="${BUILD_ARG} --build-arg ubuntu_code_name=${UBUNTU_CODE_NAME}"
fi

echo "REGISTRY=${REGISTRY} UBUNTU_CODE_NAME=${UBUNTU_CODE_NAME} NAMESPACE=${NAMESPACE} BUILD_ARG=${BUILD_ARG}"

export REGISTRY=${REGISTRY}
export UBUNTU_CODE_NAME=${UBUNTU_CODE_NAME}
export NAMESPACE=${NAMESPACE}
export BUILD_ARG=${BUILD_ARG}
