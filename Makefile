TAG := 16.04

REGISTRY := docker.dragonfly.co.nz
DOCKERS := \
	dragonfly-base \
	dragonfly-tidyverse \
	dragonfly-reports 

DOCKER_TARGETS := $(addsuffix /.docker-$(TAG),$(DOCKERS))
REGISTRY_DOCKERS := $(addprefix $(REGISTRY)/,$(DOCKERS))

.PHONY: all
all: $(DOCKER_TARGETS)

.PHONY: fetch
fetch:
	$(MAKE) -B $(BASEIMAGE_TARGETS)

.PHONY: push
push: $(REGISTRY_DOCKERS)

.PHONY: deploy
deploy: fetch all push

dragonfly-tidyverse/.docker-$(TAG): dragonfly-base/.docker-$(TAG)
dragonfly-reports/.docker-$(TAG): dragonfly-base/.docker-$(TAG)

.PHONY: clean
clean:
	for d in `find . -name .docker-$(TAG) | xargs cat`; do docker rmi -f $d; done
	find . -name .docker* -delete

ubuntu/.official:
	docker pull ubuntu:$(TAG) && touch $@

%/.docker-$(TAG): %/Dockerfile
	docker build -t $(REGISTRY)/$*:$(TAG) $* && touch $@

$(REGISTRY)/%: %/.docker-$(TAG)
	docker push $(REGISTRY)/$*:$(TAG)
