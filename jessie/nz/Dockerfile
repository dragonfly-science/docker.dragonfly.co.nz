FROM debian:jessie
MAINTAINER chris@dragonfly.co.nz

RUN sed -i 's/http.debian.net/ftp.nz.debian.org/' /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
RUN echo "Pacific/Auckland" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update && \
    apt-get install -y locales && rm -rf /var/lib/apt/lists/* && \
    localedef -i en_NZ -c -f UTF-8 -A /usr/share/locale/locale.alias en_NZ.UTF-8
ENV LANG en_NZ.utf8
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
