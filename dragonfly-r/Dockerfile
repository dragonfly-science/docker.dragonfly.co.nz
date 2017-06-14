FROM docker.dragonfly.co.nz/dragonfly-base:17.04
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
# Above this line is from dragonfly-tidyverse

RUN Rscript -e "devtools::install_version('data.table', '1.10.4')"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget build-essential  \ 
    gdal-bin libgdal-dev libgdal-dev libproj-dev libgeos++-dev \
    grass jags \
    proj-bin proj-data \
    postgresql-9.6 postgresql-9.6-postgis-2.3 \
    qgis  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Postgresql setup
RUN sed -i 's/md5\|peer/trust/' /etc/postgresql/9.6/main/pg_hba.conf

# Talking to databases and other formats
RUN Rscript -e "devtools::install_version('foreign', '0.8-68')"
RUN Rscript -e "devtools::install_version('RPostgreSQL', '0.4-1')"
RUN Rscript -e "devtools::install_version('rjson', '0.2.15')"

# Reporting
RUN Rscript -e "devtools::install_version('xtable', '1.8-2')"
RUN Rscript -e "devtools::install_version('rmarkdown', '1.5')"
RUN Rscript -e "devtools::install_version('knitr', '1.16')"
RUN Rscript -e "devtools::install_version('pander', '0.6.0')"

# GIS
RUN Rscript -e "devtools::install_version('shapefiles', '0.7')"
RUN Rscript -e "devtools::install_version('maptools', '0.9-2')"
RUN Rscript -e "devtools::install_version('rgeos', '0.3-23')"
RUN Rscript -e "devtools::install_version('mapproj', '1.2-5')"
RUN Rscript -e "devtools::install_version('rgdal', '1.2-7')"
RUN Rscript -e "devtools::install_version('sp', '1.2-4')"
RUN Rscript -e "devtools::install_version('rgrass7', '0.1-9')"

# Plotting
RUN Rscript -e "devtools::install_version('RColorBrewer', '1.1-2')"
RUN Rscript -e "devtools::install_version('viridis', '0.4.0')"
RUN Rscript -e "devtools::install_version('gridExtra', '2.2.1')"
RUN Rscript -e "devtools::install_version('gridSVG', '1.5-1')"
RUN Rscript -e "devtools::install_version('lattice', '0.20-35')"

# Bayesian modelling
RUN Rscript -e "devtools::install_version('rjags', '4-6')"
RUN Rscript -e "devtools::install_version('rstan', '2.15.1')"
RUN Rscript -e "devtools::install_version('R2jags', '0.5-7')"
RUN Rscript -e "devtools::install_version('coda', '0.19-1')"
RUN Rscript -e "devtools::install_version('ggmcmc', '1.1')"

# Maximum likelihood modelling
RUN Rscript -e "devtools::install_version('MASS', '7.3-47')"
RUN Rscript -e "devtools::install_version('lme4', '1.1-13')"
RUN Rscript -e "devtools::install_version('cplm', '0.7-5')"
RUN Rscript -e "devtools::install_version('tables', '0.8')"

