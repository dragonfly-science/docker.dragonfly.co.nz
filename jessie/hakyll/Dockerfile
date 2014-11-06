FROM docker.dragonfly.co.nz/jessie/nz
MAINTAINER chris@dragonfly.co.nz

RUN apt-get update && \
    apt-get install -y libghc-hakyll-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
