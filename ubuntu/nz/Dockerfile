FROM ubuntu:14.04
MAINTAINER chris@dragonfly.co.nz

# use New Zealand mirrors and set timezone to Auckland

RUN sed -i 's/archive/nz.archive/' /etc/apt/sources.list
RUN echo "Pacific/Auckland" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN locale-gen en_NZ.UTF-8
RUN dpkg-reconfigure locales

ENV LANG en_NZ.UTF-8
ENV LANGUAGE en_NZ:en

# vim: syntax=Dockerfile
# creates a user that will write file that are group writable
# in the dragonfly group. Also can run as sudo
RUN groupadd -r -g 14000 df && useradd -m -r -g df -u 15999 df
USER df:df
RUN echo "umask 002" >> $HOME/.bashrc
RUN echo "umask 002" >> $HOME/.profile
USER root

RUN usermod -a -G sudo df
RUN echo '%sudo	ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

