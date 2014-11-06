FROM docker.dragonfly.co.nz/ubuntu/ghc-hvrppa
MAINTAINER chris@dragonfly.co.nz

RUN apt-get update && \
    apt-get install -y wget && \
    wget http://www.haskell.org/cabal/release/cabal-install-1.20.0.3/cabal-install-1.20.0.3.tar.gz && \
    tar xf cabal-install-1.20.0.3.tar.gz && \
    cd cabal-install-1.20.0.3 && \
    ./bootstrap.sh --global --no-doc && \
    cd .. && rm -r cabal-install-* && \
    apt-get remove -y wget && apt-get autoremove -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


