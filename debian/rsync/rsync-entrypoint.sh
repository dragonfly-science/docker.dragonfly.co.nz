#!/bin/bash

RSYNCUSER=${RSYNCUSER:-nobody}
RSYNCGROUP=${RSYNCGROUP:-nogroup}

if [ "$VOLUME" = "" ]; then
    echo "You must define a volume enviroment variable"
    exit 1
fi

ALLOW=${ALLOW:-192.168.0.0/16 172.16.0.0/12}

[ -f /etc/rsyncd.conf ] || cat <<EOF > /etc/rsyncd.conf
uid = $RSYNCUSER
gid = $RSYNCGROUP
use chroot = yes
pid file = /var/run/rsyncd.pid
log file = /dev/stdout

[volume]
    hosts deny = *
    hosts allow = ${ALLOW}
    read only = false
    path = ${VOLUME}
    comment = docker volume
EOF

exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf "$@"