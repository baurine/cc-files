.PHONY: build

build:
	cd speedscope && npm install
	./scripts/build-release.sh
	go run cmd/main.go
