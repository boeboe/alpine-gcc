# General release info
DOCKER_ACCOUNT := boeboe
GCC_VERSION    := 11.2.0
ALPINE_VERSION := 3.11

BUILD_ARGS		 := --build-arg GCC_VERSION=${GCC_VERSION} --build-arg ALPINE_VERSION=${ALPINE_VERSION}

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build the container
	docker build ${BUILD_ARGS} --no-cache -t $(DOCKER_ACCOUNT)/alpine-${ALPINE_VERSION}-gcc-${GCC_VERSION} .

publish: ## Tag and publish container
	docker tag $(DOCKER_ACCOUNT)/alpine-${ALPINE_VERSION}-gcc-${GCC_VERSION} $(DOCKER_ACCOUNT)/alpine-gcc:${ALPINE_VERSION}-$(GCC_VERSION)
	docker push $(DOCKER_ACCOUNT)/alpine-gcc:${ALPINE_VERSION}-$(GCC_VERSION)

release: build publish ## Make a full release
