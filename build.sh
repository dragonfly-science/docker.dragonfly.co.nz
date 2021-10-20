#!/bin/bash

set -e

export DATE=$(date +%Y-%m-%d)

#make dragonfly

#AWS_PROFILE=dragonfly-ecr
#AWS_REGION=us-east-1
#
#aws configure --profile ${AWS_PROFILE} set aws_access_key_id ${AWS_ACCESS_KEY_ID}
#aws configure --profile ${AWS_PROFILE} set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
#aws configure --profile ${AWS_PROFILE} set region ${AWS_REGION}
#eval $(aws ecr get-login --profile ${AWS_PROFILE} | sed 's| -e none||')
#
#make aws

DOCKERHUB_USERNAME=deployhub1
docker login --username ${DOCKERHUB_USERNAME} --password ${DOCKERHUB_PASSWORD}

make dockerhub

exit $?
