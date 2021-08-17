#!/bin/bash
# setup.sh for localhist

die() {
    echo "ERROR: $@" >&2
    exit 1
}

canonpath() {
    ( cd -L -- "$(dirname -- $0)"; echo "$(pwd -P)/$(basename -- $0)" )
}

Script=$(canonpath "$0")
Scriptdir=$(dirname -- "$Script")
inode() {
    ( command ls -i "$1" | command awk '{print $1}') 2>/dev/null
}

is_on_path() {
    local tgt_dir="$1"
    [[ -z $tgt_dir ]] && { true; return; }
    IFS=":" local vv=( $PATH )
    for v in "${vv[@]}"; do
        if [[ $tgt_dir == $v ]]; then
            true; return
        fi
    done
    false
}

path_fixup() {
    # Add ~/.local/bin to the PATH if it's not already.  Modify
    # either .bash_profile or .profile honoring bash startup rules.
    local tgt_dir="$1"
    if is_on_path "${tgt_dir}"; then
        return
    fi
    local profile=$HOME/.bash_profile
    [[ -f $profile ]] || profile=$HOME/.profile
    echo "export PATH=$HOME/.local/bin:$PATH # Added by localhist setup.sh" >> ${profile} || die 202
    echo "~/.local/bin added to PATH.  Shell reload required." >&2
}

completion_fixup() {
    # Setup ~/.bash_completion.d/localhist-completion.bash.  The
    # completion logic in bash searches this dir.
    [[ -d $HOME/.bash_completion.d ]] ||  mkdir -p $HOME/.bash_completion.d
    ln -sf ${Scriptdir}/localhist-completion.bash $HOME/.bash_completion.d/
}

main() {
    if [[ ! -d $HOME/.local/bin/localhist ]]; then
        mkdir -p $HOME/.local/bin/localhist || die "Failed creating $HOME/.local/bin/localhist"
    fi
    if [[ $(inode $Script) -eq $(inode ${HOME}/.local/bin/localhist/setup.sh) ]]; then
        die "cannot run setup.sh from ${HOME}/.local/bin"
    fi
    orgDir=$PWD
    cd ${HOME}/.local/bin/localhist || die "101"
    rm -rf ./* || die "102"
    cp -r ${orgDir}/* ./ || die "failed copying from ${orgDir} to $PWD"
    cd .. # Now we're in .local/bin
    ln -sf localhist/localhist-*.sh ./  # We need these on the PATH
    path_fixup "$PWD" || die "102"
    completion_fixup "$PWD" || die  "103"
}

[[ -z $sourceMe ]] && main "$@"
