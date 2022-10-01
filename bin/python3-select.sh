#!/bin/bash

export BEST_PY3

python3_select() {
    local cand;
    for cand in python3.{11,10,9,8,7,6,5} python3 python; do
        local py_cand="$( command which ${cand} 2>/dev/null)"
	    [[ -n $MSYS ]] && {
            "$py_cand" -c 'import sys; sys.exit(0)' &>/dev/null || continue
        } || {
            # On Unix-ish shells, avoid a Windows versions of python:
            "$py_cand" -c 'import termios' &>/dev/null || \
		    continue  # We don't want a dos/windows version
        }
        BEST_PY3="${py_cand}"
        break
    done
    [[ -n "$BEST_PY3" ]] || {
        echo "ERROR: no python3 on path" >&2; false; return;
    }
    echo "$BEST_PY3"
}

python3() {
    [[ -n ${BEST_PY3} ]] || {
        python3_select >/dev/null || exit 1
    }
    [[ $1 == "--detect" ]] && {
        echo "$BEST_PY3"
        [[ -n $BEST_PY3 ]]
        exit
    }
    "$BEST_PY3" "$@"
}

[[ -z $sourceMe ]] && {
    python3 "$@"
}

