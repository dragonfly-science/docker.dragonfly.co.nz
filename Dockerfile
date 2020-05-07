FROM ubuntu:18.04
MAINTAINER edward@dragonfly.co.nz
RUN apt-get update
RUN apt-get -y install apt-transport-https ca-certificates \
    curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce build-essential
