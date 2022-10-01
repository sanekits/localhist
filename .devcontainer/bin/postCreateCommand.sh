#!/bin/bash
# vscode-docker-user-init.sh
# Invoked when vscode builds the dev container, our job is to improve the 'vscode' user environment

scriptName="$(readlink -f "$0")"
scriptDir=$(command dirname -- "${scriptName}")

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

main() {
    sudo mkdir -p /vdata/home \
        && sudo chown vscode:vscode /vdata/home -R

    (
        cd /host_home/.local/bin || die 101
        for kit in cdpp gitsmart ps1-foo looper; do
            ${kit}/setup.sh || die 102
        done
    )

    (
        for xx in bashrc cdpprc tox-index; do
            [[ -f /vdata/home/.${xx} ]] && ln -sf /vdata/home/.${xx} ~/
        done

    )

    (
        cd ~
        ln -sf /host_home/.gitconfig
        [[ -e ~/projects ]] || {
            ln -sf /workspaces ~/projects
        }
    )
    true
}

[[ -z ${sourceMe} ]] && {
    main "$@"
    builtin exit
}
command true

