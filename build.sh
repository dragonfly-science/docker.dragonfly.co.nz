#!/bin/bash

set -eu

export TZ="Pacific/Auckland"
export DATE=$(date +%Y-%m-%d)

cp /input/MPI-Latex-Templates/mpi-latex-templates_1.55_all.deb dragonfly-reports/
cp /input/Dragonfly-Latex-Templates/dragonfly-latex-templates_2.03_all.deb dragonfly-reports/

DOCKERHUB_USERNAME=deployhub1
docker login --username ${DOCKERHUB_USERNAME} --password ${DOCKERHUB_PASSWORD}
make dockerhub
