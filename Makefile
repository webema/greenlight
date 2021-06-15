.PHONY: all build push

image_name := ema/greenlight
repo_uri := nexus.devops-e.de:8090

all: build push

build:
	docker build --pull --build-arg FA_NPM_TOKEN -t $(image_name) .

push:
	docker tag $(image_name):latest $(repo_uri)/$(image_name):latest
	docker push $(repo_uri)/$(image_name):latest
