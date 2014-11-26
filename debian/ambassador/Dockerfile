FROM docker.dragonfly.co.nz/debian/nz
MAINTAINER chris@dragonfly.co.nz

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        socat && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
