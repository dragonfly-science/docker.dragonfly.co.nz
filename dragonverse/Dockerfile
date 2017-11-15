FROM docker.dragonfly.co.nz/dragonfly-reports-17.04
MAINTAINER edward@dragonfly.co.nz

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget build-essential  \ 
    gdal-bin libgdal-dev libgdal-dev libproj-dev libgeos++-dev \
    grass jags \
    proj-bin proj-data \
    postgresql-9.6 postgresql-9.6-postgis-2.3 \
    qgis \
    libudunits2-0 libudunits2-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Postgresql setup
RUN sed -i 's/md5\|peer/trust/' /etc/postgresql/9.6/main/pg_hba.conf

# Talking to databases and other formats
RUN Rscript -e "devtools::install_version('foreign', '0.8-68')"
RUN Rscript -e "devtools::install_version('RPostgreSQL', '0.4-1')"
RUN Rscript -e "devtools::install_version('rjson', '0.2.15')"
RUN Rscript -e "devtools::install_version('dbplyr', '1.1.0')"

# Data structures
RUN Rscript -e "devtools::install_version('data.tree', '0.7.0')"
RUN Rscript -e "devtools::install_version('ape', '4.1')"

# GIS
RUN Rscript -e "devtools::install_version('shapefiles', '0.7')"
RUN Rscript -e "devtools::install_version('maptools', '0.9-2')"
RUN Rscript -e "devtools::install_version('rgeos', '0.3-23')"
RUN Rscript -e "devtools::install_version('mapproj', '1.2-5')"
RUN Rscript -e "devtools::install_version('rgdal', '1.2-7')"
RUN Rscript -e "devtools::install_version('sf', '0.5-1')"
RUN Rscript -e "devtools::install_version('rgrass7', '0.1-9')"
RUN Rscript -e "devtools::install_version('raster', '2.5-8')"

# Plotting
RUN Rscript -e "devtools::install_version('RColorBrewer', '1.1-2')"
RUN Rscript -e "devtools::install_version('viridis', '0.4.0')"
RUN Rscript -e "devtools::install_version('gridExtra', '2.2.1')"
RUN Rscript -e "devtools::install_version('gridSVG', '1.5-1')"
RUN Rscript -e "devtools::install_version('ggrepel', '0.6.5')"
RUN Rscript -e "devtools::install_version('directlabels', '2017.03.31')"
RUN Rscript -e "devtools::install_version('plotrix', '3.6-5')"
RUN Rscript -e "devtools::install_version('cowplot', '0.7.0')"
RUN Rscript -e "devtools::install_version('ggsn', '0.4.0')"
RUN Rscript -e "devtools::install_github('dragonfly-science/plotmapbox', ref='760d17b')"

# Bayesian modelling
RUN Rscript -e "devtools::install_version('rjags', '4-6')"
RUN Rscript -e "devtools::install_version('StanHeaders', '2.16.0-1')"
RUN Rscript -e "devtools::install_version('rstan', '2.16.2')"
RUN Rscript -e "devtools::install_version('coda', '0.19-1')"
RUN Rscript -e "devtools::install_version('ggmcmc', '1.1')"
RUN Rscript -e "devtools::install_version('loo', '1.1.0')"

# Maximum likelihood modelling
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libnlopt-dev && \ 
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN Rscript -e "devtools::install_version('MASS', '7.3-47')"
RUN Rscript -e "devtools::install_version('lme4', '1.1-13')"
RUN Rscript -e "devtools::install_version('cplm', '0.7-5')"
RUN Rscript -e "devtools::install_version('tables', '0.8')"

# Code management
RUN Rscript -e "devtools::install_version('testthat', '1.0.2')"
