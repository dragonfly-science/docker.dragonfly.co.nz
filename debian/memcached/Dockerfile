FROM docker.dragonfly.co.nz/debian/nz

RUN apt-get update && \
    apt-get install -y libevent-2.0.5 \
    libevent-core-2.0.5 \
    libevent-extra-2.0.5 \
    libevent-openssl-2.0.5 \
    libevent-pthreads-2.0.5 && \
    apt-get install -y libevent-dev build-essential wget && \
    wget http://memcached.org/files/memcached-1.4.20.tar.gz && \
    tar -zxvf memcached-1.4.20.tar.gz && \
    cd memcached-1.4.20 && \
    ./configure && make && make test && make install && \
    cd .. && rm -rf memcached* && \
    apt-get autoremove -y libevent-dev build-essential wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT /usr/local/bin/memcached
USER www-data
EXPOSE 11211
