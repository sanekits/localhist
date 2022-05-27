#!/bin/bash
#  Catalogue the ~/.localhist tree

die() {
    builtin echo "ERROR: $@" >&2
    exit 1
}

histevent_count() {
    ( command grep -vE '^#[0-9]+' ${1} 2>/dev/null || :) | command wc -l
}

builtin cd ~/.localhist || die '~/.localhist not found'

do_cleanup=false # -c|--cleanup

for arg; do
    case $arg in
        -c|--cleanup)
            do_cleanup=true
            ;;
        *)
            echo "WARNING: unknown arg \"$arg\"" >&2
            ;;
    esac
done

set -- `ls`

for xf; do
    [[ -h ${xf} ]] || continue
    (
        xr=$(readlink -f "$xf")
        [[ -f "$xr" ]] || { 
            if ! $do_cleanup; then
                echo "  Skipping non-file $xf; use --cleanup to purge dead links." >&2 ; 
            else
                rm ${xf} && echo  "  Removed non-file $xf" >&2
            fi
            continue; 
        }
        fn1=$(command basename -- "$xr")
        dn1=$(command dirname -- "${xr}")
        builtin cd ${dn1} || die "  Can't cd to $dn1"
        lastmod=$(command stat -c %y ${fn1})
        builtin echo "${dn1} mod: ${lastmod:0:16} events: $(histevent_count ${fn1})"
    )
done

