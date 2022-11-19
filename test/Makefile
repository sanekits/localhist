# Makefile for localhist/test

absdir:=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

SHELL:=/bin/bash
LH_BIN=$(realpath $(PWD)/../bin)

ArchiverDepends:=$(LH_BIN)/localhist-archive.sh $(LH_BIN)/bash_history_tool.py Makefile $(LH_BIN)/localhistrc.template

Python3 := $(shell ../bin/python3-select.sh --detect)

.PHONY: help
help:
	@$(MAKE) -s --print-data-base --question no-such-target 2>/dev/null | \
	grep -v  -e '^Makefile' -e '^help' | \
	awk '/^[^.%][-A-Za-z0-9_]*:/ \
			{ print substr($$1, 1, length($$1)-1) }' | \
	sort | \
	pr --omit-pagination --width=100 --columns=3

home1/.localhistrc: $(LH_BIN)/localhistrc.template
	export XHOME=$(PWD)/home1 ; \
	@rm home1/.localhistrc &>/dev/null; \
	sed "s/HOME/XHOME/g" $(LH_BIN)/localhistrc.template \
		> home1/.localhistrc


# The .localhist-archive/current is a symlink pointing to the
# latest month dir ( e.g.  .localhist-archive/2022-09 )
home1/.localhist-archive/current/bash_history: home1/.localhistrc home1/.bash_history $(ArchiverDepends)
	set -x ; \
	export XHOME=$(PWD)/home1 ; \
	export LH_ARCHIVE=$(PWD)/home1/.localhist-archive/fakehost; \
	touch -d "-2 day" $${LH_ARCHIVE}/.dailymaint ; \
	ls -al $${LH_ARCHIVE}/.dailymaint; \
	HOSTNAME=fakehost $(LH_BIN)/localhist-archive.sh --login

.PHONY: fake-90days
fake-90days:
	@for age_days in {90..1}; do \
		epo=$$(date -d "-$${age_days} days" +%s); \
		dpo=$$(date -d "@$$epo"); \
		printf "#$${epo}\necho This message is $$age_days days old # $$dpo\n"; \
	done;

.flag/.gitignore:
	mkdir -p .flag
	echo '*' > .flag/.gitignore

.PHONY: home2-sources
home2-sources:
    # List of source files used in home2/ test data
	@srcdir=/host_home/journal/lh_archive/pf140XGZ ; \
	ls -Sr $$srcdir | tail -n 10 | sed -e "s|^|$$srcdir/|"

.flag/home2-data:
    # We ignore home2 because it has data we don't want to source control with localhist
	@mkdir -p home2/pf140XGZ ; \
	echo  '*' > home2/.gitignore ; \
	cp $$( $(MAKE) -s home2-sources ) home2/pf140XGZ/ ; \
	touch .flag/home2-data

.PHONY: home2-data
home2-data: .flag/.gitignore .flag/home2-data

.PHONY: pytest-installed
pytest-installed:
	# TODO: use this clue to get self-signed cert working:
	# https://stackoverflow.com/a/26062583/237059
	$(Python3) -c 'import pytest' &>/dev/null \
		|| $(Python3) -m pip install pytest


.PHONY: unit-test
unit-test: pytest-installed
	export LH_ROOT=$(realpath $(absdir)/..); \
	PYTHONPATH=$${LH_ROOT}/bin $(Python3) -m pytest ./

.PHONY: test-home1
test-home1: home1/.localhist-archive/current/bash_history

.PHONY: test
test: test-home1

.PHONY: clean
clean:
	rm -rf home1/.localhist-archive
	rm .flag/*
