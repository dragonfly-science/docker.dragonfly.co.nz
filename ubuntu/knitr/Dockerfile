FROM docker.dragonfly.co.nz/ubuntu/texlive
MAINTAINER chris@dragonfly.co.nz

RUN echo "deb http://cran.stat.auckland.ac.nz/bin/linux/ubuntu trusty/" > /etc/apt/sources.list.d/cran.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        r-base-dev \
        r-recommended \
        r-base \
        libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "deb http://packages.dragonfly.co.nz/apt/ stable dragonfly" > /etc/apt/sources.list.d/dragonfly.list
RUN curl http://packages.dragonfly.co.nz/apt/dragonfly.gpg | apt-key add -
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        dragonfly-latex-templates && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY useful_r.r /tmp/
RUN Rscript /tmp/useful_r.r