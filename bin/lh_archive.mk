# lh_archive.mk
#

# lh_archive.mk: this expects to run with cwd=~/.localhist (or wherever the lh cache is)

SHELL := /bin/bash
HOST := $(shell uname -n)
LH_BIN := $(HOME)/.local/bin/localhist
LH_ARCHIVE := $(HOME)/.localhist-archive
HISTFILES = $(filter-out root, $(wildcard *))
TGTFILES = $(patsubst %, $(LH_ARCHIVE)/$(HOST)/%, $(HISTFILES))

.PHONY: all

all: $(LH_ARCHIVE)/$(LH_HOST) $(TGTFILES)

$(LH_ARCHIVE)/$(LH_HOST):
	mkdir -p $(LH_ARCHIVE)/$(LH_HOST)

$(TGTFILES): $(LH_ARCHIVE)/$(HOST)/% : %
	@[[ -n $$LH_ARCHIVE ]] || { echo "Error: LH_ARCHIVE not defined"; exit 1; }
	@[[ -n $(HOST) ]] || { echo "Fail: HOST not set" >&2; exit 1; }
	@mkdir -p $(LH_ARCHIVE)/$(HOST)
	@echo Copying $<:
	cp $< $(LH_ARCHIVE)/$(HOST)/
	$(LH_BIN)/localhist-cleanup.sh $(LH_ARCHIVE)/$(HOST)/$<


