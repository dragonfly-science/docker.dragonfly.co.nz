FROM docker.dragonfly.co.nz/dragonfly-base:16.04
MAINTAINER edward@dragonfly.co.nz

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base-dev r-recommended r-base \
        git-core libssl-dev curl libpq-dev libssh2-1-dev libcurl4-openssl-dev libxml2-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY Rprofile.site /etc/R/

RUN Rscript -e "install.packages('devtools')"
RUN Rscript -e "devtools::install_version('dplyr', '0.7.0')"
RUN Rscript -e "devtools::install_version('ggplot2', '2.2.1')"
RUN Rscript -e "devtools::install_version('tidyverse', '1.1.1')"
