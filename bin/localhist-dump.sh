#!/bin/bash

die() {
    echo "ERROR: $@" >&2
}

colorcomments() {
    while read line; do
        if [[ $line != *#* ]]; then
            continue
        fi

    done
}

while [[ -n $1 ]]; do
    case $1 in
        -c|--commented)
            filter='#'
            ;;
        -f|--file)
            HISTFILE="$2"
            shift
            ;;
        *)
            die "Unknown argument \"$1\""
            ;;
    esac
    shift
done

HISTTIMEFORMAT="%F %H:%M " # we want date/time stamps
history -r
if [[ -n $filter ]]; then
    builtin history | command grep -E "$filter"
else
    history
fi
            
echo -e "\$HISTFILE=\033[;33m$HISTFILE\033[;0m" >&2
[[ -n $filter ]] && echo -e "  (filtered with 'grep $filter')"
