FROM debian:12
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y awscli
