FROM docker.dragonfly.co.nz/ubuntu/nz

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286\
 && echo 'deb     http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' >> /etc/apt/sources.list.d/haskell.list\
 && echo 'deb-src http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' >> /etc/apt/sources.list.d/haskell.list

ENV VERSION_GHC    7.8.3

RUN apt-get update && apt-get install -y \
    build-essential \
    libgmp-dev \
    libz-dev \
    ghc-"${VERSION_GHC}" && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## link the binaries into /usr/local/bin
RUN find /opt -maxdepth 3 -name bin -type d \
  -exec sh -c \
    'cd {} && ls . \
      | egrep -v ^.*\-[.[:digit:]]+$ \
      | xargs -I % ln -s `pwd`/% /usr/bin/%' \;
