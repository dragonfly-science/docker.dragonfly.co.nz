FROM docker.dragonfly.co.nz/ubuntu/texlive-r
MAINTAINER richard@dragonfly.co.nz

RUN apt-get update && apt-get install --no-install-recommends -y postgresql-client-9.3 git-core pandoc python-pygments jags
RUN apt-get update && apt-get install -y python-swiftclient

RUN apt-get install -y gdal-bin libgdal-dev libgdal1-dev libproj-dev libgeos-3.4.2 libgeos-dev proj-bin proj-data geos-dev


COPY r_requirements.r /etc/kahawai-jobserver/r_requirements.r

RUN R --slave < /etc/kahawai-jobserver/r_requirements.r

# TODO: something less fragile
RUN groupadd -g 1003 deployhub && useradd -m -g deployhub -u 1003 deployhub

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-add-repository multiverse && apt-get update
RUN apt-get install -y msttcorefonts
# libraries necessary to run docker
RUN apt-get install -y libapparmor1 libsystemd-journal0 libcgmanager0 libnih-dbus1 libnih1 libdbus-1-3 libgcrypt11
RUN apt-get install -y wget

COPY fonts/ /usr/local/share/fonts/


COPY dragonfly-latex-templates_1.11_all.deb /tmp/ 
RUN dpkg -i /tmp/dragonfly-latex-templates_1.11_all.deb
COPY mpi-latex-templates_1.8_all.deb /tmp/ 
RUN dpkg -i /tmp/mpi-latex-templates_1.8_all.deb
