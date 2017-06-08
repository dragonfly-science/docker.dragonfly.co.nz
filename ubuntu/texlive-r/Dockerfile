FROM docker.dragonfly.co.nz/ubuntu/texlive:17.04
MAINTAINER edward@dragonfly.co.nz

RUN apt-get update 
RUN apt-get install -y dirmngr
RUN echo "deb http://cran.stat.auckland.ac.nz/bin/linux/ubuntu zesty/" > /etc/apt/sources.list.d/cran.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base-dev \
        r-recommended \
        r-base \
        libpq-dev \
        curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
