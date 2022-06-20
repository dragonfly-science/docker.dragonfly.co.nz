#!/bin/bash

set -eu
export DATE=$(date +%Y-%m-%d)
cp /input/MPI-Latex-Templates/mpi-latex-templates_1.42_all.deb dragonfly-reports/
docker login --username deployhub1 --password ${DOCKERHUB_PASSWORD}
make dockerhub
