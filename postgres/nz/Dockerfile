FROM postgres:9.3
MAINTAINER chris@dragonfly.co.nz

# Sets the time zone and locale to NZ
# Also installs pgtap

RUN sed -i 's/http.debian.net/ftp.nz.debian.org/' /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN echo "Pacific/Auckland" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN localedef -i en_NZ -c -f UTF-8 -A /usr/share/locale/locale.alias en_NZ.UTF-8
ENV LANG en_NZ.utf8
ENV LANGUAGE en_NZ:en

RUN apt-get update && \
    apt-get install -y make unzip wget postgresql-server-dev-9.3 patch && \

    wget http://api.pgxn.org/dist/pgtap/0.94.0/pgtap-0.94.0.zip && \
    unzip pgtap-0.94.0.zip  && \
    make -C pgtap-0.94.0 && \
    make install -C pgtap-0.94.0 && \
    rm -r pgtap* && \

    apt-get remove -y make unzip wget postgresql-server-dev-9.3 patch && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql

ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH

# I want to control the postgresql volume extenally
# The key to this is to change the PGDATA environment variable set in the postgresql
# image and point it elsewhere and the mount that as a volume

