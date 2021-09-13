UBUNTU := 20.04
DATE ?= $(shell date +%Y-%m-%d)
GIT_TAG ?= $(shell git log --oneline | head -n1 | awk '{print $$1}')

DRAGONFLY := docker.dragonfly.co.nz
AWS := "121565642659.dkr.ecr.us-east-1.amazonaws.com"
DOCKERHUB := dragonflyscience

DOCKERS := dragonfly-reports \
	   dragonverse 

DOCKER_TARGETS := $(addsuffix /.docker,$(DOCKERS))
DRAGONFLY_DOCKERS := $(addprefix $(DRAGONFLY)/,$(DOCKERS))
AWS_DOCKERS := $(addprefix $(AWS)/,$(DOCKERS))
DOCKERHUB_DOCKERS := $(addprefix $(DOCKERHUB)/,$(DOCKERS))

.PHONY: all
all: $(DOCKER_TARGETS)

.PHONY: dragonfly
dragonfly: $(DRAGONFLY_DOCKERS)

.PHONY: aws
aws: $(AWS_DOCKERS)

.PHONY: dockerhub
dockerhub: $(DOCKERHUB_DOCKERS)

dragonfly-tidyverse/.docker: dragonfly-base/.docker
dragonfly-reports/.docker: dragonfly-tidyverse/.docker 
dragonverse/.docker: dragonfly-reports/.docker

dragonfly-base/.docker: dragonfly-base/Dockerfile
	docker pull ubuntu:$(UBUNTU)
	docker build --iidfile $@ -t dragonfly-base dragonfly-base

%/.docker: %/Dockerfile
	docker build --iidfile $@ -t $* $*

$(DRAGONFLY)/%: %/.docker
	docker tag $* $(DRAGONFLY)/$*-$(UBUNTU):$(DATE) && \
	docker tag $(DRAGONFLY)/$*-$(UBUNTU):$(DATE) $(DRAGONFLY)/$*-$(UBUNTU):latest && \
	docker push $(DRAGONFLY)/$*-$(UBUNTU):$(DATE) && \
	docker push $(DRAGONFLY)/$*-$(UBUNTU):latest && \
	echo "[$(DATE)] docker push $(DRAGONFLY)/$*-$(UBUNTU):$(DATE)" >> log.txt

$(AWS)/%: %/.docker
	docker tag $* $(AWS)/$*-$(UBUNTU):$(DATE) && \
	docker tag $(AWS)/$*-$(UBUNTU):$(DATE) $(AWS)/$*-$(UBUNTU):latest && \
	docker push $(AWS)/$*-$(UBUNTU):$(DATE) && \
	docker push $(AWS)/$*-$(UBUNTU):latest

$(DOCKERHUB)/%: %/.docker
	docker tag $* $(DOCKERHUB)/$*-$(UBUNTU):$(DATE) && \
	docker tag $(DOCKERHUB)/$*-$(UBUNTU):$(DATE) $(DOCKERHUB)/$*-$(UBUNTU):latest && \
	docker push $(DOCKERHUB)/$*-$(UBUNTU):$(DATE) && \
	docker push $(DOCKERHUB)/$*-$(UBUNTU):latest

DOTDOCKERS := $(shell find . -name .docker | xargs cat)

.PHONY: clean
clean:
	docker rmi -f $(DOTDOCKERS)
	find . -name .docker* -delete

docker:
	docker build -t $(DRAGONFLY)/docker-build:$(GIT_TAG) . && \
	docker tag $(DRAGONFLY)/docker-build:$(GIT_TAG) $(DRAGONFLY)/docker-build:latest && \
	docker push $(DRAGONFLY)/docker-build:$(GIT_TAG) && \
	docker push $(DRAGONFLY)/docker-build:latest
