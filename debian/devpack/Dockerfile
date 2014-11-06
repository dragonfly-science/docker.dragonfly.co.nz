FROM docker.dragonfly.co.nz/debian/nz
# Based on https://github.com/docker-library/buildpack-deps/blob/master/wheezy/Dockerfile

RUN apt-get update && apt-get install -y \
		autoconf \
		build-essential \
		imagemagick \
		libbz2-dev \
		libcurl4-openssl-dev \
		libevent-dev \
		libffi-dev \
		libglib2.0-dev \
		libgmp-dev \
		libjpeg-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libncurses-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		zlib1g-dev \
		git \
		wget && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

