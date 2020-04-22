FROM docker.dragonfly.co.nz/dragonfly-base-18.04:2020-04-22
MAINTAINER edward@dragonfly.co.nz

# Docker with texlive and debian tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fakeroot build-essential lintian devscripts \
        texlive-full biber && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-add-repository multiverse && \ 
    apt-get update && \
    apt-get install -y msttcorefonts && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY fonts/ /usr/local/share/fonts/

RUN apt-get update && \
    apt-get install -y debhelper && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
