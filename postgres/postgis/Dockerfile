FROM docker.dragonfly.co.nz/postgres/nz
MAINTAINER chris@dragonfly.co.nz

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libjson0 libgeos-3.3.3 libgeos-c1 libproj0 proj-bin proj-data && \
    apt-get install -y wget postgresql-server-dev-9.3 libjson0-dev libgeos-dev libxml2-dev build-essential libproj-dev && \

    wget http://download.osgeo.org/gdal/1.11.1/gdal-1.11.1.tar.xz && \
    tar xf gdal-1.11.1.tar.xz && \
    cd gdal-1.11.1 && ./configure && make -j8 && make install && cd .. && \

    wget http://download.osgeo.org/postgis/source/postgis-2.1.4.tar.gz && \
    tar xf postgis-2.1.4.tar.gz && \
    cd postgis-2.1.4 && ./configure && make -j8 && make install && cd .. && \

    rm -r postgis-2.1.4* && \
    rm -r gdal-1.11.1* && \
    apt-get remove -y wget postgresql-server-dev-9.3 libjson0-dev libgeos-dev libxml2-dev build-essential libproj-dev make && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
