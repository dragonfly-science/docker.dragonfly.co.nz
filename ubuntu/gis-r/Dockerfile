FROM docker.dragonfly.co.nz/ubuntu/nz:17.04
MAINTAINER finlay@dragonfly.co.nz

RUN echo "deb http://cran.stat.auckland.ac.nz/bin/linux/ubuntu trusty/" > /etc/apt/sources.list.d/cran.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
RUN apt-get update

# * GDAL:
RUN apt-get install -y gdal-bin  libgdal-dev  libgdal1-dev  libproj-dev
 
# * GRASS:
RUN apt-get install -y grass # (should be grass 7.0 using ubuntugis repo)
 
# * GEOS:
RUN apt-get install -y libgeos-3.4.2 libgeos-dev
 
# * PROJ:
RUN apt-get install -y proj-bin proj-data
 
# * Postgres and PostGIS
RUN apt-get install -y postgresql postgis
# RUN createuser -s dba 
 
# * R packages: 
RUN apt-get install -y r-base-core r-recommended r-base libpq-dev 

COPY r_requirements.r /etc/r_requirements.r
RUN R --slave < /etc/r_requirements.r

RUN sed -i 's/md5\|peer/trust/' /etc/postgresql/9.3/main/pg_hba.conf

# for spgrass: install.packages("spgrass", repos="http://R-Forge.R-project.org")

RUN apt-get install -y qgis
RUN apt-get install -y wget

