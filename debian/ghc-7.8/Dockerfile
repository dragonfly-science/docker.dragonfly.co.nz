FROM docker.dragonfly.co.nz/debian/nz
MAINTAINER chris@dragonfly.co.nz

RUN echo "deb     http://deb.haskell.org/stable/ ./" > /etc/apt/sources.list.d/ghc.list
RUN echo "deb-src http://deb.haskell.org/stable/ ./" >> /etc/apt/sources.list.d/ghc.list

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl http://deb.haskell.org/deb.haskell.org.gpg-key | apt-key add -

RUN apt-get update && \
    apt-get install -y \
        ghc-7.8.3 \
        cabal-install-1.20 \
        libz-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /opt/cabal/1.20/bin/cabal /usr/local/bin/cabal && \
    for i in `ls /opt/ghc/7.8.3/bin`; do ln -s /opt/ghc/7.8.3/bin/$i /usr/local/bin/$i; done
