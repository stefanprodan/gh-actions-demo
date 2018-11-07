DOCKER_IMAGE?=stefanprodan/gh-actions-demo
DOCKER_TAG?=$(shell git symbolic-ref --short HEAD)
GIT_REPOSITORY?=stefanprodan/gh-actions-demo
GIT_SHA:=$(shell git describe --dirty --always)

.PHONY: all
all: test build

.PHONY: test
test:
	go test ./...

.PHONY: build
build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) \
     --build-arg REPOSITORY=${GIT_REPOSITORY} \
     --build-arg SHA=${GIT_SHA} -f Dockerfile.gh .
