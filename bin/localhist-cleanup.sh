#!/bin/bash
# Remove unwanted junk from given histfiles
#

die() {
    echo "ERROR: $@" >&2
    exit 1
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

Script=$(readlink -f $0)
Scriptdir=$(dirname $Script)
Scriptname=$(basename $Script)

Python() {
    local py=$( ${Scriptdir}/python3-select.sh ) "$@"
}

do_help() {
    cat <<-EOF
$Scriptname [filename [...filenames]]

- Remove low-value and duplicate history and order each file by timestamp.
- Does not merge the time-ordering between multiple input files.
- Outputs to stdout

Examples:

    1: $Scriptname \$HISTFILE my-other-histfile

    2: cat \$HISTFILE | $Scriptname - > /tmp/clean-history.txt

EOF
}



parseArgs() {
    [[ $# -le 0 ]] && die "Expected at least one filename to clean"

    local cleanup_list=()
    while [[ -n $1 ]]; do
        case $1 in
            -h|--help)
                shift
                do_help "$@"
                exit
                ;;
            -)
                cleanup_list+=("--input /dev/stdin")
                ;;
            *)
                [[ -f $1 ]] || {
                    echo "ERROR: Can't find file $1" >&2
                    shift
                    continue
                }
                cleanup_list+=("--input $1")
                ;;
        esac
        shift
    done
    Python ${Scriptdir}/bash_history_tool.py --mode clean ${cleanup_list[@]}
}

if [[ -z $sourceMe ]]; then
    parseArgs "$@"
fi
