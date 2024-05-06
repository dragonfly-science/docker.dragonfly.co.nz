FROM dragonfly-tidyverse
MAINTAINER edward@dragonfly.co.nz
ENV DEBIAN_FRONTEND noninteractive

# Latex
RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-full biber && \
    apt-get update && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-add-repository multiverse && \ 
    apt-get update && \
    apt-get install -y msttcorefonts && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY fonts/ /usr/local/share/fonts/

COPY dragonfly-latex-templates_2.03_all.deb /tmp/ 
RUN dpkg -i /tmp/dragonfly-latex-templates_2.03_all.deb
COPY mpi-latex-templates_1.58_all.deb /tmp/
RUN dpkg -i /tmp/mpi-latex-templates_1.58_all.deb

# Upgrade
RUN apt-get update && \
    apt-get upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y python3-pygments && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# R packages

# Where available, install required R packages from the deb
# packages provided by https://launchpad.net/~c2d4u.team
RUN apt-get update && \
    apt-get install -y r-cran-data.table r-cran-xtable r-cran-brew r-cran-rmarkdown r-cran-pander \
    r-cran-kableextra && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
