FROM docker.dragonfly.co.nz/postgres/postgis
MAINTAINER chris@dragonfly.co.nz

RUN echo "deb http://cran.stat.auckland.ac.nz/bin/linux/debian wheezy-cran3/" > /etc/apt/sources.list.d/cran.list
RUN apt-key adv --keyserver keys.gnupg.net --recv-key 381BA480

RUN apt-get update && \
    apt-get install -y --no-install-recommends postgresql-9.3-plr && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

