# General release info
DOCKER_ACCOUNT := boeboe
GCC_VERSION    := 11.1.0

BUILD_ARGS		 := --build-arg GCC_VERSION=${GCC_VERSION}

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build the container
	docker build ${BUILD_ARGS} -t $(DOCKER_ACCOUNT)/alpine-3.11-gcc -f ./Dockerfile.alpine-3.11 .
	docker build ${BUILD_ARGS} -t $(DOCKER_ACCOUNT)/alpine-3.12-gcc -f ./Dockerfile.alpine-3.12 .
	docker build ${BUILD_ARGS} -t $(DOCKER_ACCOUNT)/alpine-3.13-gcc -f ./Dockerfile.alpine-3.13 .
	docker build ${BUILD_ARGS} -t $(DOCKER_ACCOUNT)/alpine-3.14-gcc -f ./Dockerfile.alpine-3.14 .

build-nc: ## Build the container without caching
	docker build ${BUILD_ARGS} --no-cache -t $(DOCKER_ACCOUNT)/alpine-3.11-gcc -f ./Dockerfile.alpine-3.11 .
	docker build --no-cache -t $(DOCKER_ACCOUNT)/alpine-3.12-gcc -f ./Dockerfile.alpine-3.12 .
	docker build ${BUILD_ARGS} --no-cache -t $(DOCKER_ACCOUNT)/alpine-3.13-gcc -f ./Dockerfile.alpine-3.13 .
	docker build ${BUILD_ARGS} --no-cache -t $(DOCKER_ACCOUNT)/alpine-3.14-gcc -f ./Dockerfile.alpine-3.14 .

release: build-nc publish ## Make a full release

publish: ## Tag and publish container
	docker tag $(DOCKER_ACCOUNT)/alpine-3.11-gcc $(DOCKER_ACCOUNT)/alpine-gcc:3.11-$(GCC_VERSION)
	docker push $(DOCKER_ACCOUNT)/alpine-gcc:3.11-$(GCC_VERSION)

	docker tag $(DOCKER_ACCOUNT)/alpine-3.12-gcc $(DOCKER_ACCOUNT)/alpine-gcc:3.12-$(GCC_VERSION)
	docker push $(DOCKER_ACCOUNT)/alpine-gcc:3.12-$(GCC_VERSION)

	docker tag $(DOCKER_ACCOUNT)/alpine-3.13-gcc $(DOCKER_ACCOUNT)/alpine-gcc:3.13-$(GCC_VERSION)
	docker push $(DOCKER_ACCOUNT)/alpine-gcc:3.13-$(GCC_VERSION)

	docker tag $(DOCKER_ACCOUNT)/alpine-3.14-gcc $(DOCKER_ACCOUNT)/alpine-gcc:3.14-$(GCC_VERSION)
	docker push $(DOCKER_ACCOUNT)/alpine-gcc:3.14-$(GCC_VERSION)
