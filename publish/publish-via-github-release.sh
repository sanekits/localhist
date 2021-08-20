#!/bin/bash
# publish/publish-via-github-release.sh

Script=$(readlink -f $0)
Scriptdir=$(dirname $Script)

die() {
    echo "ERROR: $@" >&2
    exit 1
}

if [[ -z $sourceMe ]]; then
    cd ${Scriptdir}/../bin || die 100
    if [[ $(command git status -s . | wc -l 2>/dev/null) -gt 0 ]]; then
        die "One or more files in $PWD need to be committed before publish"
    fi
    command git rev-parse HEAD > ./hashfile || die 104
    cd ${Scriptdir}/.. || die 101
    mkdir -p tmp

    tar czv --transform 's,^,localhist/,' -f tmp/new-localhist.tgz bin/ || die 102

    version=$(bin/localhist-version.sh | cut -f2)
    [[ -z $version ]] && die 103
    read -n 1 -p "Ready to make ${PWD}/tmp/localhist-${version}.tgz.  Ok? [y/N]"
    echo
    [[ $REPLY =~ [yY] ]] || die "Cancelled"
    mv tmp/new-localhist.tgz tmp/localhist-${version}.tgz || die Failed renaming tmp/new-localhist.tgz
    echo "Done: upload $PWD/tmp/localhist-${version}.tgz to Github release page"
fi
