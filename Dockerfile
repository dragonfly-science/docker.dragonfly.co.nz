FROM debian:10
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y awscli
