FROM docker.dragonfly.co.nz/ubuntu/cabal-install

RUN ln -s /lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/libtinfo.so
RUN cabal update && \
    cabal install --global -j Elm-0.13 elm-repl-0.3 elm-reactor-0.1 elm-get-0.1.3 && \
    rm -r $HOME/.cabal/packages

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
