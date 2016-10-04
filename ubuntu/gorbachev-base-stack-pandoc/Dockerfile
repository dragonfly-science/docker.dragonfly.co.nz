FROM docker.dragonfly.co.nz/ubuntu/gorbachev-base

RUN curl -sSL https://get.haskellstack.org/ | sh
ENV STACK_ROOT /stack
RUN stack setup 8.0.1 && stack install --allow-different-user pandoc pandoc-types cassava

