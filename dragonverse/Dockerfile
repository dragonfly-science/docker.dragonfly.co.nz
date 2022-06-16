FROM dragonfly-reports
MAINTAINER edward@dragonfly.co.nz
ENV DEBIAN_FRONTEND noninteractive

RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable

RUN apt-get update && \
    apt-get install -y --no-install-recommends postgresql-client \
                                               git-core \
                                               python-pygments \
                                               jags \
                                               gdal-bin \
                                               libudunits2-dev \
                                               libcairo2-dev \
                                               libxt-dev \
                                               libv8-dev \
                                               libssl-dev \
                                               libgmp3-dev \
                                               pandoc \
                                               && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Talking to databases and other formats
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-foreign r-cran-rpostgresql r-cran-rjson r-cran-jsonlite r-cran-dbplyr r-cran-data.tree r-cran-ape && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN Rscript -e "install.packages(c('aws.s3'))"
				
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libpq-dev libgdal-dev libgeos-dev libproj-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# GIS
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-shapefiles \
    r-cran-maptools \
    r-cran-mapproj \
    r-cran-rgdal \
    r-cran-sf \
    r-cran-raster \
    r-cran-terra \
    r-cran-lwgeom && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Plotting and utils
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-rcolorbrewer \
    r-cran-viridis \
    r-cran-gridextra \
    r-cran-gridsvg \
    r-cran-ggrepel \
    r-cran-directlabels \
    r-cran-plotrix \
    r-cran-cowplot \
    r-cran-ggsn \
    r-cran-cairo \
    r-cran-here \
    r-cran-furrr \
    r-cran-drake \
    r-cran-prettydoc && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Bayes & Co
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-rjags \
    r-cran-coda \
    r-cran-ggmcmc \
    r-cran-bayesplot \
    r-cran-loo \
    r-cran-mass \
    r-cran-lme4 \
    r-cran-mgcv \
    r-cran-cplm \
    r-cran-tables \
    r-cran-testthat \
    r-cran-tidymodels \
    r-cran-stanheaders \
    r-cran-rstan \
    r-cran-brms \
    && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Not available from the launchpad apt repo:

# GIS
RUN Rscript -e "install.packages(c('rgeos','rgrass7','leaflet','leafem','mapview'))"
# Plotting and utils
RUN Rscript -e "install.packages(c('plotmapbox', 'Rmdformats', 'paletteer'))"
# Bayes & Co
RUN Rscript -e "install.packages(c('tidybayes','inlabru'))"
