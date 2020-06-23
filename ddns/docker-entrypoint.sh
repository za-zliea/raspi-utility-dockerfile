#!/bin/bash

echo "RECOVRY CRONTAB FILE"
CRON_DDNS_CONF=$CRON_CONF/ddns
CRON_DDNS_ENV=/usr/local/bin/ddns-env

if [ ! -f "$CRON_DDNS_CONF" ]; then
    touch $CRON_DDNS_CONF
fi


if [ -n "$PROXY" ]; then
    echo "#/bin/bash" > $CRON_DDNS_ENV
    echo "PROXY=\"$PROXY\"" >> $CRON_DDNS_ENV
fi

if [ ! -f "$CRON_DDNS_ENV" ]; then
    echo "#/bin/bash" > $CRON_DDNS_ENV
fi

chmod +x $CRON_DDNS_ENV

exec "$@"
