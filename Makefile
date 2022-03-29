.PHONY: all prepare gen

all: prepare gen

prepare:
	./scripts/prepare.sh

gen:
	go run cmd/main.go
