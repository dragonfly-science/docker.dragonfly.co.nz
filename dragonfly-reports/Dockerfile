FROM docker.dragonfly.co.nz/dragonfly-base:16.04

# R
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
RUN Rscript -e "devtools::install_version('data.table', '1.10.4')"

# Reproducibility
RUN Rscript -e "devtools::install_version('xtable', '1.8-2')"
RUN Rscript -e "devtools::install_version('rmarkdown', '1.5')"
RUN Rscript -e "devtools::install_version('knitr', '1.16')"
RUN Rscript -e "devtools::install_version('pander', '0.6.0')"

# Latex
RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-full biber && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-add-repository multiverse && \ 
    apt-get update && \
    apt-get install -y msttcorefonts && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY fonts/ /usr/local/share/fonts/

COPY dragonfly-latex-templates_1.13_all.deb /tmp/ 
RUN dpkg -i /tmp/dragonfly-latex-templates_1.13_all.deb
COPY mpi-latex-templates_1.10_all.deb /tmp/ 
RUN dpkg -i /tmp/mpi-latex-templates_1.10_all.deb

