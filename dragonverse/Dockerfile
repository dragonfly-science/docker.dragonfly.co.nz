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
    r-cran-mapview \
    r-cran-raster \
    r-cran-rapidjsonr \
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
    r-cran-egg \
    r-cran-furrr \
    r-cran-ggpubr \
    r-cran-ggrepel \
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


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-paletteer \
   r-cran-tidybayes \
    r-cran-rmdformats \
#   r-cran-performance \
    r-cran-ternary \
    r-cran-systemfonts \
    r-cran-flextable \
    r-cran-reactable \
    r-cran-reactable.extras \
    r-cran-sparkline \
    r-cran-gt \
    r-cran-reticulate \
    r-cran-tinytable \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


##  # The following are not available from the launchpad apt repo; install source packages
RUN Rscript -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos"))); cmdstanr::install_cmdstan()'

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.26/quarto-1.8.26-linux-amd64.deb && \
	dpkg -i quarto-1.8.26-linux-amd64.deb

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pandas python3-numpy python3-matplotlib \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Typst, for building Dragonfly reports (@local/dragonfly-report and @local/distiller).
# The packages and IBM Plex fonts are copied from typst-context/, which `make` fills from the
# sibling checkouts (see the makefile). Typst reads @local packages from TYPST_PACKAGE_PATH and
# keeps downloaded @preview packages in TYPST_PACKAGE_CACHE_PATH (writable by any user).
ARG TYPST_VERSION=0.15.1
RUN apt-get update && \
    apt-get install -y --no-install-recommends xz-utils fontconfig && \
    wget -qO /tmp/typst.tar.xz \
      https://github.com/typst/typst/releases/download/v${TYPST_VERSION}/typst-x86_64-unknown-linux-musl.tar.xz && \
    tar xf /tmp/typst.tar.xz --strip-components=1 -C /usr/local/bin typst-x86_64-unknown-linux-musl/typst && \
    rm /tmp/typst.tar.xz && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV TYPST_PACKAGE_PATH=/usr/local/share/typst/packages \
    TYPST_PACKAGE_CACHE_PATH=/usr/local/share/typst/cache
COPY typst-context/fonts/*.otf /usr/local/share/fonts/IBMPlex/
COPY typst-context/dragonfly-report/ /usr/local/share/typst/packages/local/dragonfly-report/0.1.0/
COPY typst-context/distiller/ /usr/local/share/typst/packages/local/distiller/0.1.0/
RUN fc-cache -f /usr/local/share/fonts/IBMPlex && \
    mkdir -p ${TYPST_PACKAGE_CACHE_PATH} && chmod 1777 ${TYPST_PACKAGE_CACHE_PATH}

# Check that Typst and the Dragonfly template compile, and pre-fetch the @preview packages that
# the template imports into the cache.
RUN printf '#import "@local/dragonfly-report:0.1.0": *\n#import "@local/distiller:0.1.0": *\nHello\n' > /tmp/t.typ && \
    typst compile --root /tmp /tmp/t.typ /tmp/t.pdf && rm /tmp/t.typ /tmp/t.pdf && \
    chmod -R a+rwX ${TYPST_PACKAGE_CACHE_PATH}
