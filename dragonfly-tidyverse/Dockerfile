FROM docker.dragonfly.co.nz/dragonfly-base-17.10
MAINTAINER edward@dragonfly.co.nz

RUN cat '

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base-dev r-recommended r-base \
        git-core libssl-dev curl libpq-dev libssh2-1-dev libcurl4-openssl-dev libxml2-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Sets the cran repository to point to a snapshot
COPY Rprofile.site /etc/R/

RUN Rscript -e "install.packages(c('devtools', 'dplyr', 'ggplot2', 'tidyverse'))"
