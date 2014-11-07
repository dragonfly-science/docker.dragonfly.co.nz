FROM docker.dragonfly.co.nz/debian/nz
MAINTAINER chris@dragonfly.co.nz

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        vim-tiny \
        less \
        postgresql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PAGER less
ENV LESS -iMSx4 -FX
