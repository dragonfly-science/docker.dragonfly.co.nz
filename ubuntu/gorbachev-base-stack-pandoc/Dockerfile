FROM docker.dragonfly.co.nz/ubuntu/gorbachev-base

RUN curl -sSL https://get.haskellstack.org/ | sh
ENV STACK_ROOT /stack
RUN stack setup 8.0.1 
RUN echo "local-bin-path: /usr/local/bin" > /stack/config.yaml
RUN stack install --allow-different-user \
    pandoc \
    pandoc-types \
    cassava \
    diagrams \
    diagrams-postscript

