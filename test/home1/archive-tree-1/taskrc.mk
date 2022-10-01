# taskrc.mk for archive-tree-1
#
#  TODO: add targets for your project here.  When you run
#  "tmk <target-name>", the current dir will not change but
#  this makefile will be invoked.


absdir := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
SHELL := /bin/bash
REMAKE := $(MAKE) -C $(absdir) -s -f $(lastword $(MAKEFILE_LIST))

Buckets=$(shell find ./* -type d | sed -e 's|$$|/bash_history|' -e 's|^\./||')
MakeFakeEvents=../../make-fake-history-events.sh

.PHONY: help
help:
	@echo "Targets in $(basename $(lastword $(MAKEFILE_LIST))):" >&2
	@$(REMAKE) --print-data-base --question no-such-target 2>/dev/null | \
	grep -Ev  -e '^taskrc.mk' -e '^help' -e '^(Makefile|GNUmakefile|makefile|no-such-target)' | \
	awk '/^[^.%][-A-Za-z0-9_]*:/ \
			{ print substr($$1, 1, length($$1)-1) }' | \
	sort | \
	pr --omit-pagination --width=100 --columns=3
	@echo -e "absdir=\t\t$(absdir)"
	@echo -e "CURDIR=\t\t$(CURDIR)"
	@echo -e "taskrc_dir=\t$${taskrc_dir}"


.PHONY: fake-history-files
fake-history-files:
	for kk in $(Buckets); do \
		dd=$$(dirname $$kk); \
		dat="$${dd}-01 11:32:00"; \
		cdat=$$(date -d "$$dat" +%s); \
		cmd="$(MakeFakeEvents) --start-date $$cdat"  ; \
		$$cmd > $$kk; \
	done
