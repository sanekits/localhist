#!/bin/bash
# Remove unwanted junk from given histfile

die() {
    echo "ERROR: $@" >&2
    exit 1
}

stub() {
    echo "stub[$@]" >&2
}

Script=$(readlink -f $0)
Scriptdir=$(dirname $Script)

Python=$(which python3.11 python3.10 python3.9 python3.8 python3.7 python3.6 python3.5 2>/dev/null | head -n 1)

use_python_cleaner=true

histevent_count() {
    ( grep -vE '^#[0-9]+' ${1} 2>/dev/null || :) | wc -l
}

cleanup_histfile() {
    local file=$1
    local tmpf=$(mktemp)
    local old_event_count=$(histevent_count ${file})
    trap "rm ${tmpf} &>/dev/null" exit
    if $use_python_cleaner && [[ -n $Python ]] && [[ -r ${Scriptdir}/bash_history_tool.py ]]; then
        $Python ${Scriptdir}/bash_history_tool.py <${file} >${tmpf} || die "Failed cleaning in bash_history_tool.py"
    else
        cleanup_histstream <${file} >${tmpf}
    fi
    cat ${tmpf} > ${file}
    local new_event_count=$(histevent_count ${file})
    echo "Done cleaning $file: ${old_event_count} -> ${new_event_count} events"
}

cleanup_histstream() {
    local timestamp="#$(date +%s)"
    local prev_line
    while read line; do
        #stub "raw:$line"
        # Is this a timestamp?
        if [[ $line =~ ^#[[:digit:]]+$ ]]; then
            timestamp=$line
            #stub "<timestamp>"
            continue
        fi
        if [[ ${line} == ${prev_line} ]]; then
            continue  # Simplistic dupe removal
        # We're not interested in lines less than this long:
        elif ! [[ $line =~ .+\# ]]; then
            continue
        fi
        prev_line=${line}
        echo "$timestamp"
        echo -E $line
    done
}

parseArgs() {
    [[ -z $1 ]] && die Filename expected as \$1
    [[ -f $1 ]] || die Can\'t find $1
    target_file=$1
}

if [[ -z $sourceMe ]]; then
    parseArgs "$@"
    cleanup_histfile $target_file
fi
