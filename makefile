UBUNTU := 18.04
DATE := $(shell date +%Y-%m-%d)
GIT_TAG ?= $(shell git log --oneline | head -n1 | awk '{print $$1}')

REGISTRY := docker.dragonfly.co.nz
#DOCKERS := dragonfly-base \
#	dragonfly-tidyverse \
#	dragonfly-reports \
#	dragonverse \
#
DOCKERS := 	dragonfly-reports \
	dragonverse 

DOCKER_TARGETS := $(addsuffix /.docker,$(DOCKERS))
REGISTRY_DOCKERS := $(addprefix $(REGISTRY)/,$(DOCKERS))

.PHONY: all
all: $(DOCKER_TARGETS)

.PHONY: push
push: $(REGISTRY_DOCKERS)

.PHONY: deploy
deploy: all push

dragonfly-tidyverse/.docker: dragonfly-base/.docker
dragonfly-reports/.docker: dragonfly-tidyverse/.docker 
dragonverse/.docker: dragonfly-reports/.docker

.PHONY: clean
clean:
	for d in `find . -name .docker | xargs cat`; do docker rmi -f $d; done
	find . -name .docker* -delete

%/.docker: %/Dockerfile
	docker build -t $(REGISTRY)/$*-$(UBUNTU):$(DATE) $* && touch $@ && \
	echo "[$(DATE)] docker build -t $(REGISTRY)/$*-$(UBUNTU)" >> log.txt

$(REGISTRY)/%: %/.docker
	docker tag $(REGISTRY)/$*-$(UBUNTU):$(DATE) $(REGISTRY)/$*-$(UBUNTU):latest && \
	docker push $(REGISTRY)/$*-$(UBUNTU):$(DATE) && \
	docker push $(REGISTRY)/$*-$(UBUNTU):latest && \
	echo "[$(DATE)] docker push $(REGISTRY)/$*-$(UBUNTU):$(DATE)" >> log.txt


docker:
	docker build -t $(REGISTRY)/docker-build:$(GIT_TAG) . && \
	docker tag $(REGISTRY)/docker-build:$(GIT_TAG) $(REGISTRY)/docker-build:latest && \
	docker push $(REGISTRY)/docker-build:$(GIT_TAG) && \
	docker push $(REGISTRY)/docker-build:latest


docker-push:
	docker push $(IMAGE):$(GIT_TAG)
	docker push $(IMAGE):latest
