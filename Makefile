PROLOG ?= gprolog
GPLC ?= gplc
BIN := bin/stakeholder
SRC := src/stakeholder.pl

.PHONY: all compiler-proof analyze build test
all: build

compiler-proof:
	$(PROLOG) --version | sed -n '1,5p'
	$(GPLC) --version | sed -n '1,5p'

analyze:
	$(GPLC) -o /tmp/prolog-stakeholder-analyze $(SRC)

build:
	mkdir -p bin
	$(GPLC) -o $(BIN) $(SRC)

test: build
	BIN=$(BIN) tests/test_cli.sh
