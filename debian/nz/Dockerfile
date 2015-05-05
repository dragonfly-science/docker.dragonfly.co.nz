FROM debian:jessie
MAINTAINER chris@dragonfly.co.nz

RUN sed -i 's/http.debian.net/ftp.nz.debian.org/' /etc/apt/sources.list

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

ENV DEBIAN_FRONTEND noninteractive
RUN echo "Pacific/Auckland" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update && \
    apt-get install -y locales && rm -rf /var/lib/apt/lists/* && \
    localedef -i en_NZ -c -f UTF-8 -A /usr/share/locale/locale.alias en_NZ.UTF-8
ENV LANG en_NZ.utf8
ENV LANGUAGE en_NZ:en

