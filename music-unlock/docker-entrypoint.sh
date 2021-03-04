#!/bin/bash

if [[ "$1" = "music-unlock-init" ]]; then
    echo "check MusicUnlock Root Dir is empty"
    if [ "$(ls -A ${MUSIC_UNLOCK_ROOT_DIR})" ]; then
        echo "MusicUnlock Root Dir is not empty, check version"

	if [ "$(cat ${MUSIC_UNLOCK_ROOT_DIR}/.music-unlock.version)" == "${MUSIC_UNLOCK_VERSION}" ]; then
            echo "MusicUnlock Version check match, skip copy"
	else
            echo "MusicUnlock Version check mismatch, clean and copy files"
	    rm -Rf ${MUSIC_UNLOCK_ROOT_DIR}/*
	    cp -r ${MUSIC_UNLOCK_BACKUP_DIR}/. ${MUSIC_UNLOCK_ROOT_DIR}
        fi
    else
        echo "MusicUnlock Root Dir is empty, copy files"
	cp -r ${MUSIC_UNLOCK_BACKUP_DIR}/. ${MUSIC_UNLOCK_ROOT_DIR}
    fi
else
    "$@"
fi


