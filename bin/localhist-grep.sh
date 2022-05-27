#!/bin/bash
# localhist-grep.sh

die() {
    echo "ERROR: $@" >&2
    exit 1
}

# If first arg is -a or --archive, we will search $LH_ARCHIVE/$(hostname), otherwise
# the more expansive ~/.localhist search applies
SEARCHDIR=$HOME/.localhist

[[ $1 =~ ^(-a)|(--archive)$ ]] && { SEARCHDIR="$LH_ARCHIVE/$(hostname)"; shift; }

[[ -d $SEARCHDIR ]] || die No \$SEARCHDIR exists

echo "Searching $SEARCHDIR for pattern [$@]:" >&2

builtin cd $SEARCHDIR
for xf in $(find); do
    xf=$(command readlink -f ${xf} 2>/dev/null)
    (
        [[ -z ${xf} ]] && exit 0
        builtin cd $(command dirname -- ${xf}) 2>/dev/null || exit 0;
        set -o history
        builtin history -c
        HISTTIMEFORMAT="%F %H:%M "
        HISTFILE=$(command basename -- ${xf}) 
        builtin history -r
        builtin echo -e "\033[;33m${xf}:\033[;0m"
        builtin history | command grep -E ".*$@.*" 2>/dev/null | command sed 's/^/  /'
    )
done

