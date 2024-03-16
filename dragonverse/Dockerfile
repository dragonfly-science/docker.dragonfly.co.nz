FROM dragonfly-reports
MAINTAINER edward@dragonfly.co.nz
ENV DEBIAN_FRONTEND noninteractive

RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable

RUN apt-get update && \
    apt-get install -y --no-install-recommends postgresql-client \
                                               jags \
                                               gdal-bin \
                                               libudunits2-dev \
                                               libcairo2-dev \
                                               libxt-dev \
                                               libv8-dev \
                                               libgmp3-dev \
                                               && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Talking to databases and other formats
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-rpostgresql \
    r-cran-rjson \
    r-cran-qs \
    r-cran-data.tree \
    r-cran-ape && \
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
    r-cran-geojsonsf \
    r-cran-geometries \
    r-cran-jsonify \
    r-cran-leafem \
    r-cran-leaflet \
    r-cran-lwgeom \
    r-cran-mapproj \
    r-cran-maptools \
    r-cran-mapview \
    r-cran-rapidjsonr \
    r-cran-raster \
    r-cran-rgdal \
    r-cran-rgrass7 \
    r-cran-sf \
    r-cran-sfheaders \
    r-cran-shapefiles \
    r-cran-terra \
    && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Plotting and utils
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-cairo \
    r-cran-cowplot \
    r-cran-directlabels \
    r-cran-drake \
    r-cran-egg \
    r-cran-furrr \
    r-cran-ggpubr \
    r-cran-ggrepel \
    r-cran-ggsn \
    r-cran-ggspatial \
    r-cran-gridextra \
    r-cran-gridsvg \
    r-cran-here \
    r-cran-patchwork \
    r-cran-plotrix \
    r-cran-prettydoc \
    r-cran-rcolorbrewer \
    r-cran-viridis \
    && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Bayes & Co
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-bayesplot \
    r-cran-brms \
    r-cran-coda \
    r-cran-cplm \
    r-cran-ggmcmc \
    r-cran-lme4 \
    r-cran-loo \
    r-cran-mass \
    r-cran-mgcv \
    r-cran-rjags \
    r-cran-rstan \
    r-cran-stanheaders \
    r-cran-tables \
    r-cran-testthat \
    r-cran-tidymodels \
    && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# The following are not available from the launchpad apt repo; install source packages
RUN install_r paletteer
RUN install_r tidybayes
RUN Rscript -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos"))); cmdstanr::install_cmdstan()'

# These were once in dragonverse but did not even install in dragonverse-18.04; probably unused:
# RUN install_r plotmapbox
# RUN install_r Rmdformats

RUN install_r bayestestR 
RUN install_r performance
RUN install_r Ternary

RUN apt-get update && apt upgrade --yes

RUN install_r qs
RUN install_r sf
RUN install_r flextable

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.549/quarto-1.4.549-linux-amd64.deb && \
	dpkg -i quarto-1.4.549-linux-amd64.deb


## Install some packeges needed for the estimation project

# ludicio
RUN apt-get update && \
    apt-get install -y python-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip2 install django
RUN pip2 install progressbar

ADD ludicio ludicio/
RUN cd ludicio && python2 setup.py install

RUN Rscript -e "install.packages(c('functional'))"
RUN Rscript -e "install.packages(c('gplots'))"

# Install the 1Password CLI (Code from here https://developer.1password.com/docs/cli/get-started/)
RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | tee /etc/apt/sources.list.d/1password.list
RUN mkdir -p /etc/debsig/policies/AC2D62742012EA22/
RUN curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
RUN mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
RUN apt update && apt install -y 1password-cli && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install BRMS directly
RUN Rscript -e 'remotes::install_github("paul-buerkner/brms")'
