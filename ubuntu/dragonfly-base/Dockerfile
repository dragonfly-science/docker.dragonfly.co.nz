FROM docker.dragonfly.co.nz/ubuntu/texlive-r:17.04
MAINTAINER richard@dragonfly.co.nz

RUN apt-get update && apt-get install --no-install-recommends -y postgresql-client-9.6 git-core pandoc python-pygments jags
RUN apt-get update && apt-get install -y python-swiftclient

RUN apt-get install -y gdal-bin libgdal-dev libgdal-dev libproj-dev libgeos++-dev proj-bin proj-data
RUN apt-get install -y libssl-dev


# TODO: something less fragile
RUN groupadd -g 1003 deployhub && useradd -m -g deployhub -u 1003 deployhub

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-add-repository multiverse && apt-get update
RUN apt-get install -y msttcorefonts

COPY fonts/ /usr/local/share/fonts/

COPY dragonfly-latex-templates_1.13_all.deb /tmp/ 
RUN dpkg -i /tmp/dragonfly-latex-templates_1.13_all.deb
COPY mpi-latex-templates_1.10_all.deb /tmp/ 
RUN dpkg -i /tmp/mpi-latex-templates_1.10_all.deb

RUN Rscript -e "old = getOption('defaultPackages'); r = getOption('repos'); r['CRAN'] = 'http://cran.stat.auckland.ac.nz'; options(defaultPackages = old, repos = r)"
RUN Rscript -e "install.packages('devtools', repos=r)"
RUN Rscript -e "devtools::install_version('tidyverse', 1.1.1')"
RUN Rscript -e "devtools::install_version('knitr, '1.16')"
RUN Rscript -e "devtools::install_version('xtable', '1.0.4')"
RUN Rscript -e "devtools::install_version('xtable', '1.8-2')"
RUN Rscript -e "devtools::install_version('rgdal', '1.2-7')"
RUN Rscript -e "devtools::install_version('sp', '1.2-4')"

