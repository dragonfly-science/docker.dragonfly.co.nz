FROM dragonfly-base
MAINTAINER edward@dragonfly.co.nz
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update &&  \
    apt-get install -y --no-install-recommends libssl-dev libssh2-1-dev libcurl4-openssl-dev libxml2-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base-dev r-recommended r-base && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -q -O- https://eddelbuettel.github.io/r2u/assets/dirk_eddelbuettel_key.asc \
    | tee -a /etc/apt/trusted.gpg.d/cranapt_key.asc
RUN add-apt-repository "deb [arch=amd64] https://r2u.stat.illinois.edu/ubuntu jammy main"

RUN apt-get install -y --no-install-recommends \
        r-cran-devtools r-cran-dplyr r-cran-ggplot2 r-cran-tidyverse && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY install_r /usr/local/bin
