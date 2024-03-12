.PHONY: all
all: lint vet test

.PHONY: test
test:
	GODEBUG=x509sha1=1 go test -covermode=count -coverprofile=coverage.out .

.PHONY: showcoverage
showcoverage: test
	go tool cover -html=coverage.out

.PHONY: vet
vet:
	go vet .

.PHONY: lint
lint:
	golangci-lint run
