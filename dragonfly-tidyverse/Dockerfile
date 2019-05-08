FROM docker.dragonfly.co.nz/dragonfly-base-18.04:2019-05-09
MAINTAINER edward@dragonfly.co.nz

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base-dev r-recommended r-base \
        git-core libssl-dev curl libpq-dev libssh2-1-dev libcurl4-openssl-dev libxml2-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY Rprofile-2019-03-31.site /etc/R/Rprofile.site

RUN Rscript -e "install.packages(c('devtools','dplyr','ggplot2','tidyverse'))"
