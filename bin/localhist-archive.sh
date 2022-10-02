#!/bin/bash
# localhist-archive.sh
#

scriptName="$(readlink -f "$0")"
scriptDir=$(command dirname -- "${scriptName}")
script=$(basename $scriptName)

XHOME=${XHOME:-${HOME}}

force=false

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

do_help() {
    cat <<-EOF
localhist-archive.sh [--login] [--force]
    Archive current bash history into monthly "buckets", filtering out
low-value events (duplication, short commands, etc.).  Then the
history file is rewritten.  May be followed by "history -c; history -r"
or similar reload of in-memory events.
EOF
}

update_lh_archive() {
    # For each entry in ~/.localhist, we want to maintain a cleaned copy in $LH_ARCHIVE/$(hostname).
    make -C ~/.localhist -f ${scriptDir}/lh_archive.mk LH_ARCHIVE=${LH_ARCHIVE}
}

do_daily_maint() {
    ${scriptDir}/python3-select.sh \
        ${scriptDir}/bash_history_tool.py \
        --mode coalesce  \
        --input ${XHOME}/.bash_history \
        --output ${LH_ARCHIVE} || die
    echo "localhist coalesce completed" >&2
}

on_login() {
    # We only auto-run once per day:
    local force=false
    [[ $* == *--force* ]] && {
        force=true;
        shift;
    }
    $force || {
        [[ -d ${LH_ARCHIVE} ]] || die 'No ${LH_ARCHIVE} dir exists'

        local lastRunTicks=$( date -r ${LH_ARCHIVE}/.dailymaint +%s 2>/dev/null )
        [[ -n $lastRunTicks ]] || lastRunTicks=0
        local nowTicks=$( date +%s 2>/dev/null )
        (( ( $nowTicks - $lastRunTicks ) > 86400 )) || {
            false;
            return;
        }
    }

    (
        do_daily_maint >&2
    )
    local result=$?
    touch ${LH_ARCHIVE}/.dailymaint
    return $result
}

main() {
    (( $# > 0 )) || {
        set -- --login
    }
    local do_login=false
    local inner_opts=
    while [[ -n $1 ]]; do
        case $1 in
            -h|--help)
                do_help
                exit
                ;;
            --login)
                do_login=true
                ;;
            --force)
                inner_opts="--force $inner_opts"
                ;;
            *)
                unknown_args="$unknown_args $1"
                ;;
        esac
        shift
    done
    $do_login && {
       on_login $inner_opts
       exit
    }
    echo "$script: no command specified" >&2
    exit 1
}

[[ -z ${sourceMe} ]] && {
    main "$@"
    builtin exit
}
command true
