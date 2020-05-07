FROM ubuntu:18.04
MAINTAINER edward@dragonfly.co.nz
RUN apt-get update
RUN apt-get -y install docker.io
RUN apt-get -y install build-essential
