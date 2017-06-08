
REGISTRY := docker.dragonfly.co.nz
DOCKERS := \
	ubuntu/dragonfly-base \
	ubuntu/texlive \
	ubuntu/texlive-r \
	ubuntu/gis-r 

BASEIMAGES := \
	ubuntu 

TAG := 17.04

DOCKER_TARGETS := $(addsuffix /.docker,$(DOCKERS))
REGISTRY_DOCKERS := $(addprefix $(REGISTRY)/,$(DOCKERS))
BASEIMAGE_TARGETS := $(addsuffix /.official,$(BASEIMAGES))

.PHONY: all
all: $(DOCKER_TARGETS)

.PHONY: fetch
fetch:
	$(MAKE) -B $(BASEIMAGE_TARGETS)

.PHONY: push
push: $(REGISTRY_DOCKERS)

.PHONY: deploy
deploy: fetch all push

ubuntu/nz/.docker: ubuntu/.official
ubuntu/texlive/.docker: ubuntu/nz/.docker
ubuntu/texlive-r/.docker: ubuntu/texlive/.docker
ubuntu/dragonfly-base/.docker: ubuntu/texlive-r/.docker
ubuntu/gis-r/.docker: ubuntu/texlive/.docker

.PHONY: clean
clean:
	for d in `find . -name .docker | xargs cat`; do docker rmi -f $d; done
	find . -name .docker -delete

ubuntu/.official:
	docker pull ubuntu:$(TAG)

%/.docker: %/Dockerfile %/*
	docker build -t $(REGISTRY)/$*:$(TAG) $* && touch $@
#	@$(shell docker inspect --format='{{.Id}}' $(REGISTRY)/$*  > $@)

%/Dockerfile: %/Dockerfile.tmpl includes/df-user.inc includes/nz-locale.inc
	@cp $< $@
	@sed -i -e "/__INCLUDE_DF_USER__/r includes/df-user.inc" -e "//d" $@
	@sed -i -e "/__INCLUDE_NZ_LOCALE__/r includes/nz-locale.inc" -e "//d" $@

$(REGISTRY)/%: %/.docker
	docker push $(REGISTRY)/$*
