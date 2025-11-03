FROM dragonfly-reports
MAINTAINER edward@dragonfly.co.nz
ENV DEBIAN_FRONTEND noninteractive

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
    r-cran-ape \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-aws.s3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
    r-cran-raster \
    r-cran-rapidjsonr \
    r-cran-rgdal \
    r-cran-rgrass7 \
    r-cran-sf \
    r-cran-sfheaders \
    r-cran-shapefiles \
    r-cran-terra \
	r-cran-tidyterra \
	r-cran-maptiles \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-paletteer \
    r-cran-tidybayes \
    r-cran-rmdformats \
    r-cran-performance \
    r-cran-ternary \
    r-cran-systemfonts \
    r-cran-flextable \
    r-cran-reactable \
    r-cran-reactable.extras \
    r-cran-sparkline \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


##  # The following are not available from the launchpad apt repo; install source packages
#RUN Rscript -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos"))); cmdstanr::install_cmdstan()'

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.17/quarto-1.8.17-linux-amd64.deb && \
	dpkg -i quarto-1.8.17-linux-amd64.deb

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pandas \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
