.PHONY: all prepare_ss gen

all: prepare_ss gen

prepare_ss:
	./scripts/prepare-ss.sh

gen:
	go run cmd/main.go
