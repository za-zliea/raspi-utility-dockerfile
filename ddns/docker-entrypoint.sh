#!/bin/bash

echo "RECOVRY CRONTAB FILE"
CRON_DDNS_CONF=$CRON_CONF/ddns

if [ ! -f "$CRON_DDNS_CONF" ]; then
    touch $CRON_DDNS_CONF
fi

exec "$@"
