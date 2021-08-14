#!/bin/bash
# localhist-grep.sh

die() {
    echo "ERROR: $@" >&2
    exit 1
}

[[ -d ~/.localhist ]] || die No ~/.localhist dir exists

cd ~/.localhist
for xf in *; do
    xf=$(readlink -f ${xf})
    (
        cd $(dirname ${xf});
        set -o history
        history -c
        HISTTIMEFORMAT="%F %H:%M "
        HISTFILE=$PWD/bash_history
        history -r
        echo -e "\033[;33mcd $(pwd -P)\033[;0m"
        history | grep -E "$@" 2>/dev/null | sed 's/^/  /'
    )
done
