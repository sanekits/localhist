#!/bin/bash
#  Catalogue the ~/.localhist tree

die() {
    echo "ERROR: $@" >&2
    exit 1
}

histevent_count() {
    ( grep -vE '^#[0-9]+' ${1} 2>/dev/null || :) | wc -l
}

cd ~/.localhist || die '~/.localhist not found'

set -- `ls`

for xf; do
    [[ -h ${xf} ]] || continue
    (
        xf=$(readlink -f $xf)
        fn1=$(basename $xf)
        dn1=$(dirname ${xf})
        cd ${dn1} || die "Can't cd to $dn1"
        lastmod=$(stat -c %y ${fn1})
        echo "${dn1} mod: ${lastmod:0:16} events: $(histevent_count ${fn1})"
    )
done

