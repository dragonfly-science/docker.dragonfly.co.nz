# vim: syntax=Dockerfile
# creates a user that will write file that are group writable
# in the dragonfly group. Also can run as sudo
RUN groupadd -r -g 14000 df && useradd -m -r -g df -u 15999 df
USER df:df
RUN echo "umask 002" >> $HOME/.bashrc
RUN echo "umask 002" >> $HOME/.profile
USER root

RUN usermod -a -G sudo df
RUN echo '%sudo	ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
