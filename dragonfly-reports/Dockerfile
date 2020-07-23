FROM docker.dragonfly.co.nz/dragonfly-tidyverse-18.04:2020-07-23
MAINTAINER edward@dragonfly.co.nz


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

COPY dragonfly-latex-templates_2.0_all.deb /tmp/ 
RUN dpkg -i /tmp/dragonfly-latex-templates_2.0_all.deb
COPY mpi-latex-templates_1.25_all.deb /tmp/ 
RUN dpkg -i /tmp/mpi-latex-templates_1.25_all.deb

# Upgrade
RUN apt-get update && \
    apt-get upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y python-pygments && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# R packages
RUN Rscript -e "install.packages(c('data.table','xtable', 'rmarkdown','knitr','pander','kable', 'kableExtra'))"
