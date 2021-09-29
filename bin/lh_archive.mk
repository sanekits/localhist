# lh_archive.mk
#

# lh_archive.mk: this expects to run with cwd=~/.localhist (or wherever the lh cache is)
LH_ARCHIVE=$(HOME)/journal/lh_archive
HOST=$(HOSTNAME)
LH_BIN=/c/Projects/localhist/bin
HISTFILES = $(filter-out root, $(wildcard *))
TGTFILES = $(patsubst %, $(LH_ARCHIVE)/$(HOST)/%, $(HISTFILES))
#$(info HISTFILES=$(HISTFILES))
#$(info TGTFILES=$(TGTFILES))

.PHONY: all

all: $(TGTFILES)

$(TGTFILES): $(LH_ARCHIVE)/$(HOST)/% : %
	mkdir -p $(LH_ARCHIVE)/$(HOST)
	echo Copying $<:
	cp $< $(LH_ARCHIVE)/$(HOST)/
	$(LH_BIN)/localhist-cleanup.sh $(LH_ARCHIVE)/$(HOST)/$<


