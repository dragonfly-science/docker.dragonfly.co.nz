FROM docker.dragonfly.co.nz/ubuntu/devpack
MAINTAINER chris@dragonfly.co.nz

RUN cd tmp && \
    wget http://hub.dragonfly.co.nz/static/cache/haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz || \
    wget http://www.haskell.org/platform/download/2014.2.0.0/haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz && \
    echo "0da6879ae657481849e7ec4e5d3c4c035e090824167f97434b48af297ec17cf9  haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz" | sha256sum -c && \
    cd / && tar xf /tmp/haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz && \
    /usr/local/haskell/ghc-7.8.3-x86_64/bin/activate-hs && \
    rm -rf /tmp/*

USER df:df
RUN cabal update && cabal install cabal-install
ENV PATH /home/df/.cabal/bin:$PATH

