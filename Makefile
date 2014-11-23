
REGISTRY := docker.dragonfly.co.nz
SYNC ?= false
DOCKERS := \
	postgres/postgis\
	postgres/plr \
	postgres/postgis-plr \
	debian/python2 \
	debian/python3 \
	debian/memcached \
	debian/ghc-7.8 \
	debian/hakyll \
	debian/r-base \
	debian/pg-client \
	debian/psql \
	debian/ambassador \
	ubuntu/haskell-platform \
	ubuntu/ghc-hvrppa \
	ubuntu/cabal-install \
	ubuntu/elm \
	ubuntu/texlive \
	ruby/bourbon \
	node/nz \
	jessie/nz

DOCKER_TARGETS := $(addsuffix /.docker,$(DOCKERS))
REGISTRY_DOCKERS := $(addprefix $(REGISTRY)/,$(DOCKERS))

.PHONY: all
all: $(DOCKER_TARGETS)

.PHONY: fake
fake: $(REGISTRY_DOCKERS)

debian/nz/.docker: debian/nz/Dockerfile debian/.docker
debian/devpack/.docker: debian/nz/.docker
debian/memcached/.docker: debian/nz/.docker
debian/r-base/.docker: debian/nz/.docker
debian/pg-client/.docker: debian/nz/.docker
debian/psql/.docker: debian/pg-client/.docker
debian/python2/.docker: debian/devpack/.docker
debian/python3/.docker: debian/devpack/.docker
debian/ghc-7.8/.docker: debian/nz/.docker
debian/hakyll/.docker: debian/ghc-7.8/.docker
debian/ambassador/.docker: debian/nz/.docker

jessie/nz/.docker: jessie/nz/Dockerfile jessie/.docker
jessie/hakyll/.docker: jessie/nz/.docker

postgres/nz/.docker: postgres/.docker
postgres/postgis/.docker: postgres/nz/.docker
postgres/plr/.docker: postgres/nz/.docker
postgres/postgis-plr/.docker: postgres/postgis/.docker

ubuntu/nz/.docker: ubuntu/nz/Dockerfile ubuntu/.docker
ubuntu/devpack/.docker: ubuntu/nz/.docker
ubuntu/texlive/.docker: ubuntu/nz/.docker
ubuntu/ghc-hvrppa/.docker: ubuntu/nz/.docker
ubuntu/cabal-install/.docker: ubuntu/ghc-hvrppa/.docker
ubuntu/elm/.docker: ubuntu/cabal-install/.docker
ubuntu/haskell-platform/.docker: ubuntu/devpack/.docker

ruby/nz/.docker: ruby/nz/Dockerfile ruby/.docker
ruby/bourbon/.docker: ruby/nz/.docker

node/nz/.docker: node/nz/Dockerfile node/.docker

.PHONY: clean
clean:
	for d in `find . -name .docker | xargs cat`; do docker rmi -f $d; done
	find . -name .docker -delete

ubuntu/.docker: FORCE
	@$(if $(filter-out \
		$(shell cat $@ 2>/dev/null), \
		$(shell $(SYNC) && docker pull ubuntu:14.04 > /dev/null && \
			docker inspect --format='{{.Id}}' ubuntu:14.04  \
			)), docker inspect --format='{{.Id}}' ubuntu:14.04  > $@)

debian/.docker: FORCE
	@$(if $(filter-out \
		$(shell cat $@ 2>/dev/null), \
		$(shell $(SYNC) && docker pull debian:wheezy > /dev/null && \
			docker inspect --format='{{.Id}}' debian:wheezy  \
			)), docker inspect --format='{{.Id}}' debian:wheezy  > $@)

jessie/.docker: FORCE
	@$(if $(filter-out \
		$(shell cat $@ 2>/dev/null), \
		$(shell $(SYNC) && docker pull debian:jessie > /dev/null && \
			docker inspect --format='{{.Id}}' debian:jessie  \
			)), docker inspect --format='{{.Id}}' debian:jessie  > $@)

postgres/.docker: FORCE
	@$(if $(filter-out \
		$(shell cat $@ 2>/dev/null), \
		$(shell $(SYNC) && docker pull postgres:9.3 > /dev/null && \
			docker inspect --format='{{.Id}}' postgres:9.3  \
			)), docker inspect --format='{{.Id}}' postgres:9.3  > $@)

ruby/.docker: FORCE
	@$(if $(filter-out \
		$(shell cat $@ 2>/dev/null), \
		$(shell $(SYNC) && docker pull ruby:2.1 > /dev/null && \
			docker inspect --format='{{.Id}}' ruby:2.1  \
			)), docker inspect --format='{{.Id}}' ruby:2.1  > $@)

node/.docker: FORCE
	@$(if $(filter-out \
		$(shell cat $@ 2>/dev/null), \
		$(shell $(SYNC) && docker pull node:0.10 > /dev/null && \
			docker inspect --format='{{.Id}}' node:0.10  \
			)), docker inspect --format='{{.Id}}' node:0.10  > $@)

%/.docker: %/Dockerfile
	docker build -t $(REGISTRY)/$* $*
	@$(SYNC) && docker push $(REGISTRY)/$* || true
	@$(shell docker inspect --format='{{.Id}}' $(REGISTRY)/$*  > $@)

%/Dockerfile: %/Dockerfile.tmpl includes/df-user.inc includes/nz-locale.inc
	@cp $< $@
	@sed -i -e "/__INCLUDE_DF_USER__/r includes/df-user.inc" -e "//d" $@
	@sed -i -e "/__INCLUDE_NZ_LOCALE__/r includes/nz-locale.inc" -e "//d" $@

# Rule for syncing with registry and making makefile current
$(REGISTRY)/%:
	docker pull $@
	@$(shell docker inspect --format='{{.Id}}' $@  > $*/.docker)

FORCE:
