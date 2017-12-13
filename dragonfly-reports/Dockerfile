FROM docker.dragonfly.co.nz/dragonfly-tidyverse-17.04
MAINTAINER edward@dragonfly.co.nz

# Data manipulation
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

COPY dragonfly-latex-templates_1.16_all.deb /tmp/ 
RUN dpkg -i /tmp/dragonfly-latex-templates_1.16_all.deb
COPY mpi-latex-templates_1.18_all.deb /tmp/ 
RUN dpkg -i /tmp/mpi-latex-templates_1.18_all.deb

# Upgrade
RUN apt-get update && \
    apt-get upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y python-pygments && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
