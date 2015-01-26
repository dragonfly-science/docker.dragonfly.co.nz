FROM docker.dragonfly.co.nz/postgres/nz
MAINTAINER chris@dragonfly.co.nz

ENV POSTGIS_MAJOR 2.1
ENV POSTGIS_VERSION 2.1.5+dfsg-1~exp2~90.git884bcd4.pgdg70+1

RUN echo deb http://http.debian.net/debian wheezy-backports main >> /etc/apt/sources.list
RUN apt-get update \
      && apt-get install -y \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
      && rm -rf /var/lib/apt/lists/*
