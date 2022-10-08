#!/bin/bash
# gitsync-lh.sh

scriptName="$(readlink -f "$0")"
scriptDir=$(command dirname -- "${scriptName}")

die() {
    builtin echo "ERROR($(basename ${scriptName})): $*" >&2
    builtin exit 1
}

source ~/.localhistrc || die "Failed to source ~/.localhistrc"

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

Git()  {
    type -Pp git &>/dev/null || die "Can't find git on the PATH"
    command git "$@"
}

update_gitignore() {
   command cat >.gitignore <<-EOF
*BAK*
bash_history.???
.dailymaint
EOF
}

do_sync() {
    [[ -n $LH_ARCHIVE ]] || die "\$LH_ARCHIVE not defined"
    [[ -d $LH_ARCHIVE ]] || die "$LH_ARCHIVE dir doesn't exist"
    cd $LH_ARCHIVE || die "Can't cd to $LH_ARCHIVE"


    local repo_root=$(Git rev-parse --show-toplevel 2> /dev/null)
    [[ -n $repo_root ]] || die "Can't find working-copy root of $LH_ARCHIVE"
    cd $repo_root || die "Can't cd to $repo_root"
    echo "gitsync-lh.sh for $repo_root"

    update_gitignore
    Git add .
    Git commit -am "autocommit by gitsync-lh.sh in localhist shellkit"
    Git pull --all
    Git push --all
}

main() {
    do_sync "$@" 2>&1 | command sed 's|^|>> |'
}

[[ -z ${sourceMe} ]] && {
    main "$@"
    builtin exit
}
command true
