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
    if [[ $(command git status -s . | command wc -l 2>/dev/null) -gt 0 ]]; then
        die "One or more files in $PWD need to be committed before publish"
    fi
    command git rev-parse HEAD > ./hashfile || die 104
    builtin cd ${Scriptdir}/.. || die 101
    version=$(bin/localhist-version.sh | cut -f2)
    [[ -z $version ]] && die 103

    command mkdir -p ./tmp

    command makeself.sh $PWD/bin $TMP/localist-setup-${version}.sh "Installing localhist ${version}" ./setup.sh  # [src-dir] [dest-file] [label] [setup-command]
    echo "Done: upload $PWD/tmp/localhist-setup-${version}.sh to Github release page"
fi
