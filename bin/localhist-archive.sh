#!/bin/bash
# localhist-archive.sh
#

# For each entry in ~/.localhist, we want to maintain a cleaned copy in $LH_ARCHIVE/$(hostname).
#

cd ~/.localhist && make -f ${HOME}/.local/bin/localhist/lh_archive.mk

