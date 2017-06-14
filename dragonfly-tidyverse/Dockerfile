FROM docker.dragonfly.co.nz/dragonfly-base:17.04
MAINTAINER edward@dragonfly.co.nz

COPY r-key.txt /tmp/ 
RUN apt-key add /tmp/r-key.txt

# Provide the apt-add-repository command
RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-add-repository "deb http://cran.stat.auckland.ac.nz/bin/linux/ubuntu zesty/" && \ 
    apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base-dev r-recommended r-base \
        git-core libssl-dev curl libpq-dev libssh2-1-dev libcurl4-openssl-dev libxml2-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY Rprofile.site /etc/R/

RUN Rscript -e "install.packages('devtools')"
RUN Rscript -e "devtools::install_version('dplyr', '0.7.0')"
RUN Rscript -e "devtools::install_version('ggplot2', '2.2.1')"
RUN Rscript -e "devtools::install_version('tidyverse', '1.1.1')"
#RUN Rscript -e "devtools::install_version('rmarkdown', '1.5')"
#RUN Rscript -e "devtools::install_version('knitr', '1.16')"
#RUN Rscript -e "devtools::install_version('data.table', '1.10.4')"
#RUN Rscript -e "devtools::install_version('xtable', '1.8-2')"
#RUN Rscript -e "devtools::install_version('rgdal', '1.2-7')"
#RUN Rscript -e "devtools::install_version('sp', '1.2-4')"
#
