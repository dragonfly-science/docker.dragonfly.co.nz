FROM docker.dragonfly.co.nz/dragonfly-base-18.04:2020-07-23
MAINTAINER edward@dragonfly.co.nz

# Installing R and tidyverse packages. To update, change the date of the microsoft CRAN
# line and in the Rprofile.site file

RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg ca-certificates && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN echo 'deb https://cran.microsoft.com/snapshot/2020-07-23/bin/linux/ubuntu/ bionic-cran40/' >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base-dev r-recommended r-base \
        git-core libssl-dev curl libpq-dev libssh2-1-dev libcurl4-openssl-dev libxml2-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY Rprofile-2020-07-23.site /etc/R/Rprofile.site

RUN Rscript -e "install.packages(c('devtools','dplyr','ggplot2','tidyverse'))"
