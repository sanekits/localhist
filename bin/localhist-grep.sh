#!/bin/bash
# localhist-grep.sh

die() {
    echo "ERROR: $@" >&2
    exit 1
}

[[ -d ~/.localhist ]] || die No ~/.localhist dir exists

echo "Searching ~/.localhist for pattern [$@]:" >&2

builtin cd ~/.localhist
for xf in *; do
    xf=$(command readlink -f ${xf} 2>/dev/null)
    (
        [[ -z ${xf} ]] && continue
        builtin cd $(command dirname -- ${xf}) 2>/dev/null || continue;
        set -o history
        builtin history -c
        HISTTIMEFORMAT="%F %H:%M "
        HISTFILE=$(command basename -- ${xf}) 
        builtin history -r
        builtin echo -e "\033[;33m${xf}:\033[;0m"
        builtin history | command grep -E "$@" 2>/dev/null | command sed 's/^/  /'
    )
done
