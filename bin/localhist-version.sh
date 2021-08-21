#!/bin/bash

# Running localhist-version.sh is the correct way to
# get the home path for localhist and its tools.
LocalhistVer=0.8.1

set -e

Script=$(readlink -f "$0")
Scriptdir=$(dirname -- "$Script")


if [ -z "$sourceMe" ]; then
    printf "%s\t%s" ${Scriptdir}/localhist ${LocalhistVer}
fi
