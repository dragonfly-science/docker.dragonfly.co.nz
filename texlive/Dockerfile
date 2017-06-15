FROM docker.dragonfly.co.nz/dragonfly-base-17.04
MAINTAINER edward@dragonfly.co.nz

# Docker with texlive and debian tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fakeroot build-essential lintian devscripts \
        texlive-full biber && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

