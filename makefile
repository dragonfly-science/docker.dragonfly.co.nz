UBUNTU := 17.04
DATE := $(shell date +%Y-%m-%d)

REGISTRY := docker.dragonfly.co.nz
DOCKERS := \
	dragonfly-base \
	dragonfly-tidyverse \
	dragonfly-reports \
	dragonverse \
	texlive

DOCKER_TARGETS := $(addsuffix /.docker,$(DOCKERS))
REGISTRY_DOCKERS := $(addprefix $(REGISTRY)/,$(DOCKERS))

.PHONY: all
all: $(DOCKER_TARGETS)

.PHONY: push
push: $(REGISTRY_DOCKERS)

.PHONY: deploy
deploy: all push

dragonfly-tidyverse/.docker: dragonfly-base/.docker
texlive/.docker: dragonfly-base/.docker
dragonfly-reports/.docker: dragonfly-tidyverse/.docker 
dragonverse/.docker: dragonfly-reports/.docker

.PHONY: clean
clean:
	for d in `find . -name .docker | xargs cat`; do docker rmi -f $d; done
	find . -name .docker* -delete

%/.docker: %/Dockerfile
	docker build -t $(REGISTRY)/$*-$(UBUNTU) $* && touch $@ && \
	echo "[$(DATE)] docker build -t $(REGISTRY)/$*-$(UBUNTU)" >> log.txt

$(REGISTRY)/%: %/.docker
	docker tag $(REGISTRY)/$*-$(UBUNTU) $(REGISTRY)/$*-$(UBUNTU):$(DATE) && \
	docker tag $(REGISTRY)/$*-$(UBUNTU) $(REGISTRY)/$*-$(UBUNTU):latest && \
	docker push $(REGISTRY)/$*-$(UBUNTU):$(DATE) && \
	docker push $(REGISTRY)/$*-$(UBUNTU):latest && \
	echo "[$(DATE)] docker push $(REGISTRY)/$*-$(UBUNTU):$(DATE)" >> log.txt