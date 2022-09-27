# make-kit.mk for localhist
#  This makefile is included by the root shellkit Makefile
#  It defines values that are kit-specific.
#  You should edit it and keep it source-controlled.

# TODO: update kit_depends to include anything which
#   might require the kit version to change as seen
#   by the user -- i.e. the files that get installed,
#   or anything which generates those files.
kit_depends := \
    bin/localhist.bashrc \
	$(shell ls bin/localhist*sh)

.PHONY: publish


publish: pre-publish publish-common release-draft-upload release-list


	@echo ">>>> publish complete OK.  <<<"
	@echo ">>>> Manually publish the release from this URL when satisfied, <<<<"
	@echo ">>>> and then change ./version to avoid accidental confusion. <<<<"
	cat tmp/draft-url

.PHONY: prompt-command-wrap
prompt-command-wrap:
	$(MAKE) -C ../prompt-command-wrap build
	cp ../prompt-command-wrap/tmp/prompt-command-wrap.bashrc bin/

build: prompt-command-wrap
