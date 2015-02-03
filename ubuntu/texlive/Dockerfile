FROM docker.dragonfly.co.nz/ubuntu/nz

RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-full biber && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

