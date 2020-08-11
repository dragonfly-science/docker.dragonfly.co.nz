FROM docker.dragonfly.co.nz/dragonfly-reports-18.04:2020-07-23
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
    pandoc-citeproc s3cmd \
    libv8-dev \
    libnlopt-dev \
    libudunits2-0 libudunits2-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY pandoc-2.9.2.1-1-amd64.deb /tmp/ 
RUN dpkg -i /tmp/pandoc-2.9.2.1-1-amd64.deb
RUN rm -rf /tmp/*

#Postgresql setup
RUN sed -i 's/md5\|peer/trust/' /etc/postgresql/10/main/pg_hba.conf

# Talking to databases and other formats
RUN Rscript -e "install.packages(c('foreign','RPostgreSQL','rjson', 'jsonlite', 'dbplyr','data.tree','ape','aws.s3'))"
				
# GIS
RUN Rscript -e "install.packages(c('shapefiles','maptools','rgeos','mapproj','rgdal','sf','rgrass7','raster','leaflet','leafem','mapview'))"

# Plotting and utils
RUN Rscript -e "install.packages(c('RColorBrewer','viridis','gridExtra','gridSVG','ggrepel','directlabels','plotrix','cowplot','ggsn', 'plotmapbox', 'Cairo', 'Rmdformats', 'here', 'furrr', 'drake', 'prettydoc', 'paletteer'))"

# Bayes & Co
RUN Rscript -e "install.packages(c('rjags','rstan','brms','coda','ggmcmc','bayesplot','loo','MASS','lme4','mgcv','cplm','tables','testthat', 'tidybayes','tidymodels', 'inlabru'))"
        
RUN Rscript -e "devtools::install_github('r-spatial/lwgeom')"

