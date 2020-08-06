#!/bin/bash

if [[ "$1" = "aria-init" ]]; then
    echo "check AriaNg Root Dir is empty"
    if [ "$(ls -A ${ARIANG_ROOT_DIR})" ]; then
        echo "AriaNg Root Dir is not empty, check version"

	if [ "$(cat ${ARIANG_ROOT_DIR}/.aria2-ng.version)" == "${ARIANG_VERSION}" ]; then
            echo "AriaNg Version check match, skip copy"
	else
            echo "AriaNg Version check mismatch, clean and copy files"
	    rm -Rf ${ARIANG_ROOT_DIR}/*
	    cp -r ${ARIANG_BACKUP_DIR}/. ${ARIANG_ROOT_DIR}
        fi
    else
        echo "AriaNg Root Dir is empty, copy files"
	cp -r ${ARIANG_BACKUP_DIR}/. ${ARIANG_ROOT_DIR}
    fi
else
    "$@"
fi


