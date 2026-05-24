PROLOG ?= gprolog
GPLC ?= gplc
BIN := bin/stakeholder
SRC := src/stakeholder.pl

.PHONY: all compiler-proof build test clean

all: build

compiler-proof:
	$(PROLOG) --version | sed -n '1,5p'
	$(GPLC) --version | sed -n '1,5p'

build:
	mkdir -p bin
	$(GPLC) -o $(BIN) $(SRC)

test: build
	BIN=$(BIN) tests/test_cli.sh

clean:
	rm -rf bin
