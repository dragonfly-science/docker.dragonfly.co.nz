FROM ubuntu:22.04
MAINTAINER edward@dragonfly.co.nz
ENV DEBIAN_FRONTEND noninteractive

# RUN sed -i 's/archive/nz.archive/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y tzdata
RUN echo "Pacific/Auckland" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Set the locale to New Zealand
RUN apt-get -y install locales
RUN locale-gen en_NZ.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    gnupg ca-certificates software-properties-common dirmngr wget curl git-core awscli && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG en_NZ.UTF-8
ENV LANGUAGE en_NZ:en

