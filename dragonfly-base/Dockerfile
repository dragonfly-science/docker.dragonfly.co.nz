FROM ubuntu:18.04
MAINTAINER edward@dragonfly.co.nz
ENV DEBIAN_FRONTEND noninteractive

# Set New Zealand mirrors and set timezone to Auckland
RUN sed -i 's/archive/nz.archive/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y tzdata
RUN echo "Pacific/Auckland" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Set the locale to New Zealand
RUN apt-get -y install locales
RUN locale-gen en_NZ.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get update && \
    apt upgrade --yes && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG en_NZ.UTF-8
ENV LANGUAGE en_NZ:en

# Add a deployhub user
RUN groupadd -g 1003 deployhub && useradd -m -g deployhub -u 1003 deployhub

