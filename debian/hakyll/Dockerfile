FROM docker.dragonfly.co.nz/debian/ghc-7.8
MAINTAINER chris@dragonfly.co.nz

RUN cabal update && \
    cabal install --global hakyll && \
    rm -r /root/.cabal
