FROM docker.dragonfly.co.nz/ubuntu/texlive-r
MAINTAINER richard@dragonfly.co.nz

RUN apt-get update && apt-get install --no-install-recommends -y postgresql-client-9.3 git-core pandoc python-pygments jags
RUN apt-get update && apt-get install -y python-swiftclient

COPY r_requirements.r /etc/kahawai-jobserver/r_requirements.r

RUN R --slave < /etc/kahawai-jobserver/r_requirements.r

# TODO: something less fragile
RUN groupadd -g 1003 deployhub && useradd -m -g deployhub -u 1003 deployhub

RUN apt-get update && apt-get install -y awscli
