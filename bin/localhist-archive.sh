#!/bin/bash
# localhist-archive.sh
#

scriptName="$(readlink -f "$0")"
scriptDir=$(command dirname -- "${scriptName}")

XHOME=${XHOME:-${HOME}}

die() {
    builtin echo "ERROR($(basename ${scriptName})): $*" >&2
    builtin exit 1
}

stub() {
    # Print debug output to stderr.  Call like this:
    #   stub "${FUNCNAME[0]}.${LINENO}" "$@" "<Put your message here>"
    #
    [[ -n $NoStubs ]] && return
    builtin echo -n "  <<< STUB" >&2
    for arg in "$@"; do
        echo -n "[${arg}] " >&2
    done
    echo " >>> " >&2
}

update_lh_archive() {
    # For each entry in ~/.localhist, we want to maintain a cleaned copy in $LH_ARCHIVE/$(hostname).
    make -C ~/.localhist -f ${scriptDir}/lh_archive.mk LH_ARCHIVE=${LH_ARCHIVE}
}

do_daily_maint() {
    echo "localhist daily maintenance start" >&2
    ${scriptDir}/python3-select.sh \
        ${scriptDir}/bash_history_tool.py \
        --mode coalesce  \
        --input ${XHOME}/.bash_history \
        --output ${XHOME}/.localhist-archive || die
}

on_login() {
    # We only auto-run once per day:
    local force=false
    [[ $1 == --force ]] && {
        force=true; shift;
    }

    set -x
    if ! $force; then
        local lastRunTicks=$( date -r ${XHOME}/.localhist/.dailymaint +%s 2>/dev/null )
        [[ -n $lastRunTicks ]] || lastRunTicks=0
        local nowTicks=$( date +%s 2>/dev/null )
        (( ( $nowTicks - $lastRunTicks ) > 86400 )) || { false; return; }

        [[ -d ${LH_ARCHIVE} ]] || die 'No ~/.localhist-archive dir exists'
    fi

    ( do_daily_maint >&2 )
    local result=$?
    touch ${LH_ARCHIVE}/.dailymaint
    return $result
}

main() {
    [[ $# -eq 0 ]] && {
        update_lh_archive
        exit
    }
    set -x
    while [[ -n $1 ]]; do
        case $1 in
            -h|--help)
                die "--help not implemented"
                ;;
            --login)
                shift
                on_login "$@"
                exit
                ;;
            *)
                unknown_args="$unknown_args $1"
                ;;
        esac
        shift
    done
    set +x
}

[[ -z ${sourceMe} ]] && {
    main "$@"
    builtin exit
}
command true
