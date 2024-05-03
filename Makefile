IMAGE := magic-8ball
TAG := latest
PORT := 5000

.PHONY: build
build:
	docker build -t $(IMAGE):$(TAG) .

.PHONY: run
run:
	docker run -p $(PORT):$(PORT) $(IMAGE):$(TAG)

.PHONY: debug
debug: build run


.PHONY: publish
publish:
	helm upgrade --install magic-8ball ./helm/magic-8ball -n services 
