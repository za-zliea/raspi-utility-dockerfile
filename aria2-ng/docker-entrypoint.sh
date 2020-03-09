#!/bin/bash

if [[ "$1" = "aria-init" ]]; then
    echo "check AriaNg Root Dir is empty"
    if [ "$(ls -A ${ARIANG_ROOT_DIR})" ]; then
        echo "AriaNg Root Dir is not empty, skip copy"
    else
        echo "AriaNg Root Dir is empty, copy files"
	cp -r ${ARIANG_BACKUP_DIR}/* ${ARIANG_ROOT_DIR}
    fi
else
    "$@"
fi


