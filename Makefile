
REGISTRY := docker.dragonfly.co.nz
DOCKERS := \
	postgres/postgis\
	postgres/plr \
	postgres/postgis-plr \
	debian/python2 \
	debian/python3 \
	debian/memcached \
	debian/ghc-7.8 \
	debian/r-base \
	debian/pg-client \
	debian/psql \
	debian/ambassador \
	debian/rsync \
	ubuntu/haskell-platform \
	ubuntu/ghc-hvrppa \
	ubuntu/cabal-install \
	ubuntu/elm \
	ubuntu/texlive \
	ubuntu/texlive-r \
	ruby/bourbon \
	node/nz \
	jessie/nz

BASEIMAGES := \
	ubuntu \
	debian \
	jessie \
	postgres \
	ruby \
	node

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

debian/nz/.docker: debian/nz/Dockerfile debian/.official
debian/devpack/.docker: debian/nz/.docker
debian/memcached/.docker: debian/nz/.docker
debian/r-base/.docker: debian/nz/.docker
debian/pg-client/.docker: debian/nz/.docker
debian/psql/.docker: debian/pg-client/.docker
debian/python2/.docker: debian/devpack/.docker
debian/python3/.docker: debian/devpack/.docker
debian/ghc-7.8/.docker: debian/nz/.docker
debian/ambassador/.docker: debian/nz/.docker
debian/rsync/.docker: debian/nz/.docker

jessie/nz/.docker: jessie/nz/Dockerfile jessie/.official

postgres/nz/.docker: postgres/.official
postgres/postgis/.docker: postgres/nz/.docker
postgres/plr/.docker: postgres/nz/.docker
postgres/postgis-plr/.docker: postgres/postgis/.docker

ubuntu/nz/.docker: ubuntu/nz/Dockerfile ubuntu/.official
ubuntu/devpack/.docker: ubuntu/nz/.docker
ubuntu/texlive/.docker: ubuntu/nz/.docker
ubuntu/texlive-r/.docker: ubuntu/texlive/.docker
ubuntu/ghc-hvrppa/.docker: ubuntu/nz/.docker
ubuntu/cabal-install/.docker: ubuntu/ghc-hvrppa/.docker
ubuntu/elm/.docker: ubuntu/cabal-install/.docker
ubuntu/haskell-platform/.docker: ubuntu/devpack/.docker

ruby/nz/.docker: ruby/nz/Dockerfile ruby/.official
ruby/bourbon/.docker: ruby/nz/.docker

node/nz/.docker: node/nz/Dockerfile node/.official

fetchofficial = @$(if $(filter-out $(shell cat $@ 2>/dev/null), $(shell docker inspect --format='{{.Id}}' $(1))), docker inspect --format='{{.Id}}' $(1)  > $(2))


.PHONY: clean
clean:
	for d in `find . -name .docker | xargs cat`; do docker rmi -f $d; done
	find . -name .docker -delete

ubuntu/.official:
	docker pull ubuntu:14.04
	$(call fetchofficial,ubuntu:14.04,$@)

debian/.official:
	docker pull debian:wheezy
	$(call fetchofficial,debian:wheezy,$@)

jessie/.official:
	docker pull debian:jessie
	$(call fetchofficial,debian:jessie,$@)

postgres/.official:
	docker pull postgres:9.3
	$(call fetchofficial,postgres:9.3,$@)

ruby/.official:
	docker pull ruby
	$(call fetchofficial,ruby,$@)

node/.official:
	docker pull node
	$(call fetchofficial,node,$@)

%/.docker: %/Dockerfile %/*.sh
	docker build -t $(REGISTRY)/$* $*
	@$(shell docker inspect --format='{{.Id}}' $(REGISTRY)/$*  > $@)

%/Dockerfile: %/Dockerfile.tmpl includes/df-user.inc includes/nz-locale.inc
	@cp $< $@
	@sed -i -e "/__INCLUDE_DF_USER__/r includes/df-user.inc" -e "//d" $@
	@sed -i -e "/__INCLUDE_NZ_LOCALE__/r includes/nz-locale.inc" -e "//d" $@

$(REGISTRY)/%: %/.docker
	docker push $(REGISTRY)/$*
