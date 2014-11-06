FROM docker.dragonfly.co.nz/debian/devpack
# based on https://github.com/docker-library/python/blob/master/3.4/Dockerfile

RUN apt-get update && apt-get install -y curl procps

# remove several traces of debian python
RUN apt-get purge -y python python-minimal python2.7-minimal

RUN mkdir /usr/src/python
WORKDIR /usr/src/python

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
# ENV LANG C.UTF-8

ENV PYTHON_VERSION 3.4.2

RUN curl -SL "https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tar.xz" \
		| tar -xJ --strip-components=1
# skip "test_shutil" thanks to "PermissionError: [Errno 1] Operation not permitted" trying to set xattrs
RUN ./configure \
	&& make -j$(nproc) \
	&& make -j$(nproc) EXTRATESTOPTS='--exclude test_shutil' test \
	&& make install \
	&& make clean \
    && pip3 install ipython

CMD ["ipython3"]
