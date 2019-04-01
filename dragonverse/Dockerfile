FROM docker.dragonfly.co.nz/dragonfly-reports-18.04:2019-04-01
MAINTAINER edward@dragonfly.co.nz

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget build-essential  \ 
    gdal-bin libgdal-dev libgdal-dev libproj-dev libgeos++-dev \
    grass jags \
    proj-bin proj-data \
    postgresql-10 postgresql-10-postgis-2.4 \
    qgis \
    pandoc libcairo-dev \
    libudunits2-0 libudunits2-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Postgresql setup
RUN sed -i 's/md5\|peer/trust/' /etc/postgresql/10/main/pg_hba.conf

# Maximum likelihood modelling
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libnlopt-dev && \ 
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Talking to databases and other formats
RUN Rscript -e "install.packages(c('foreign','RPostgreSQL','rjson','dbplyr','data.tree','ape'))"
				
# GIS
RUN Rscript -e "install.packages(c('shapefiles','maptools','rgeos','mapproj','rgdal','sf','rgrass7','raster'))"

# Plotting
RUN Rscript -e "install.packages(c('RColorBrewer','viridis','gridExtra','gridSVG','ggrepel','directlabels','plotrix','cowplot','ggsn', 'plotmapbox', 'Cairo'))"

# Bayes & Co
RUN Rscript -e "install.packages(c('rjags','rstan','brms','coda','ggmcmc','bayesplot','loo','MASS','lme4','mgcv','cplm','tables','testthat'))"
        
