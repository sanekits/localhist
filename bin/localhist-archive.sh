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
        --input ${DEFAULT_HISTFILE} \
        --output ${LH_ARCHIVE} || die
    if $rewrite; then
        do_rewrite
        echo "localhist coalesce+rewrite completed" >&2
        exit
    fi
    echo "localhist coalesce completed" >&2
}

stubbash() {
    bash --rcfile <( cat ~/.bashrc; echo "LH_ARCHIVE=$LH_ARCHIVE; Ps1Tail=stubbash;")
}

do_rewrite() {
    # A rewrite involves building a fresh .bash_history from the tail
    # of the current file plus enough archived data to hit the
    # limit specified in $HISTFILESIZE
    local workDir=$(command mktemp -d )
    [[ -d $workDir ]] || die do_rewrite.501
    (
        builtin cd $workDir || die
        [[ -n $HISTFILESIZE ]] || HISTFILESIZE=10000
        # "Why export?"  It's for debugging when we drop into stubbash
        export remainder=$HISTFILESIZE
        export filenum=0
        [[ -f ${DEFAULT_HISTFILE} ]] && command tail -n 200 ${DEFAULT_HISTFILE} > history.new
        (( remainder = remainder - 100 ))
        (( filenum++ ))
        command ln -sf $LH_ARCHIVE ./archive
        export archives=$(  \
            command ls -d ./archive/* /dev/null  \
            | command grep -E '2[0-9].*-'  \
            | sort -r ; \
        )
        set -- $archives
        export archive
        for archive in $@; do
            export event_count=0
            export linecnt=$(wc -l ${archive}/bash_history | awk '{print $1}')
            (( event_count = linecnt / 2 ))
            (( event_count > 0 )) && {
                ln -sf ${archive}/bash_history ./history.$(builtin printf "%03d" $filenum)
                (( filenum++  ))
                (( remainder = remainder - event_count ))
                if (( remainder < 0 )); then
                    break
                fi
            }
            shift
        done
        command cat $(command ls -Sr history.[0-9]*) history.new > history.rewrite
        [[ -n ${DEFAULT_HISTFILE} ]] && {
            command cp ${DEFAULT_HISTFILE} ${LH_ARCHIVE}/.bash_history-BAK.$$
            command mv history.rewrite ${DEFAULT_HISTFILE} && echo "history rewritten for ${DEFAULT_HISTFILE}.  Use \"history -c; history -r\" to reload."
        }


    ) || die do_rewrite.500
}

on_login() {
    # We only auto-run once per day:
    local force=false
    local rewrite=false
    [[ $* == *--force* ]] && {
        force=true;
    }
    [[ $* == *--rewrite* ]] && {
        rewrite=true
    }
    [[ -f ~/.localhistrc ]] || die "Can't find ~/.localhistrc"
    source ~/.localhistrc
    $force || {
        [[ -d ${LH_ARCHIVE} ]] || {
            command mkdir -p ${LH_ARCHIVE}
            [[ -d ${LH_ARCHIVE} ]] || {
                die "Failed creating LH_ARCHIVE ($LH_ARCHIVE)"
            }
        }

        local lastRunTicks=$( date -r ${LH_ARCHIVE}/.dailymaint +%s 2>/dev/null )
        [[ -n $lastRunTicks ]] || lastRunTicks=0
        local nowTicks=$( date +%s 2>/dev/null )
        (( ( $nowTicks - $lastRunTicks ) > 86400 )) || {
            false;
            return;
        }
    }

    [[ -d ${LH_ARCHIVE} ]] || die "No such dir: ${LH_ARCHIVE}"
    (
        rewrite=$rewrite do_daily_maint >&2
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
    local inner_opts="--rewrite"
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
