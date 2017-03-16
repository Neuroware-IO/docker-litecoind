.PHONY: build
build:
	docker build -t neuroware/litecoind .

.PHONY: deploy
deploy: login build
	docker tag neuroware/litecoind neuroware/litecoind:$(VERSION) &&\
	docker push neuroware/litecoind

.PHONY: login
login:
	docker login
