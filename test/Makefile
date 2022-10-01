# Makefile for localhist/test

absdir:=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

SHELL:=/bin/bash
LH_BIN=$(realpath $(PWD)/../bin)

ArchiverDepends:=$(LH_BIN)/localhist-archive.sh $(LH_BIN)/bash_history_tool.py Makefile

Python3 := $(shell ../bin/python3-select.sh --detect)

.PHONY: help
help:
	@$(MAKE) -s --print-data-base --question no-such-target 2>/dev/null | \
	grep -v  -e '^Makefile' -e '^help' | \
	awk '/^[^.%][-A-Za-z0-9_]*:/ \
			{ print substr($$1, 1, length($$1)-1) }' | \
	sort | \
	pr --omit-pagination --width=100 --columns=3


# The .localhist-archive/current is a symlink pointing to the
# latest month dir ( e.g.  .localhist-archive/2022-09 )
home1/.localhist-archive/current/bash_history: home1/.bash_history $(ArchiverDepends)
	export XHOME=$(PWD)/home1 ; \
	export LH_ARCHIVE=$(PWD)/home1/.localhist-archive; \
	rm $${LH_ARCHIVE}/.dailymaint || : ; \
	$(LH_BIN)/localhist-archive.sh --login

.PHONY: unit-test
unit-test:
	PYTHONPATH=../bin $(Python3) -m pytest ./

.PHONY: test-home1
test-home1: home1/.localhist-archive/current/bash_history

.PHONY: test
test: test-home1

.PHONY: clean
clean:
	rm -rf home1/.localhist-archive
