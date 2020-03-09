#!/bin/bash

ARIA2_CONFIG_FILE=${ARIA2_CONFIG_DIR}/aria2.conf
ARIA2_SESSION_FILE=${ARIA2_CONFIG_DIR}/aria2.session
echo "check aria2 config"
if [[ ! -f "${ARIA2_CONFIG_FILE}" ]]; then
    echo "aria2 config file not exist, create"
    cp /etc/.aria2/aria2.conf ${ARIA2_CONFIG_FILE}
    if [[ -z "${RPC_SECRET}" ]]; then
        echo "not specify rpc secret, general a random rpc secret"
        RPC_SECRET=$(cat /proc/sys/kernel/random/uuid | head -c 8)
        echo ${RPC_SECRET}
    fi
    sed -i "s/<rpc_secret>/${RPC_SECRET}/g" ${ARIA2_CONFIG_FILE}
else
    echo "aria2 config exist, skip"
fi

echo "check aria2 session"
if [[ ! -f "${ARIA2_SESSION_FILE}" ]]; then
    echo "aria2 session not exist, create"
    touch ${ARIA2_SESSION_FILE}
else
    echo "aria2 session exist, skip"
fi

aria2_update_bt_tracker

exec "$@"
