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
    local vv=( $(echo "${PATH}" | tr ':' '\n') )
    for v in ${vv[@]}; do
        if [[ $tgt_dir == $v ]]; then
            return
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
    echo 'export PATH=$HOME/.local/bin:$PATH # Added by localhist setup.sh' >> ${profile} || die 202
    echo "~/.local/bin added to your PATH." >&2
    reload_reqd=true
}

shrc_fixup() {
    # We must ensure that .bashrc sources our localhist script
    local tgt_dir="$1"
    [[ $(type -t localhist) == 'function' ]] && return

    (
        echo '[[ -n $PS1 ]] && ' " source ${tgt_dir}/localhist/localhist # Added by localhist setup.sh"
        echo '[[ -n $PS1 ]] && ' " source ${HOME}/.bash_completion.d/localhist-completion.bash # Added by localhist setup.sh"
        echo
    ) >> ${HOME}/.bashrc
    echo "Your .bashrc has been updated." >&2
    reload_reqd=true
}

make_aliases() {
    # Create/update ~/.localhist-aliases
    [[ -f ${HOME}/.localhist-aliases ]] || {
        (
            echo "# Added by localhist setup.sh: you can disable or update these, and we won't overwrite them."
            echo
            echo "alias lh=localhist"
            echo "alias h=history"
            echo "shopt -s histappend  # Append to history rather than overwrite"
            echo "shopt -s histverify  # When recalling an event from history, let the user check before running"
            echo "PROMPT_COMMAND='history -a'  # Save history at each shell prompt"
            echo "HISTCONTROL=ignoredups:ignorespace "
            echo "HISTSIZE=3000 # Size of in-memory hist buffer"
            echo "HISTFILESIZE=5000 # Size of a history file"
            echo
        ) > ${HOME}/.localhist-aliases
        echo "Created ~/.localhist-aliases: you can modify this file safely." >&2
        reload_reqd=true
    }
}

completion_fixup() {
    # Setup ~/.bash_completion.d/localhist-completion.bash.  The
    # completion logic in bash searches this dir.
    [[ -d $HOME/.bash_completion.d ]] ||  mkdir -p $HOME/.bash_completion.d
    ln -sf ${Scriptdir}/localhist-completion.bash $HOME/.bash_completion.d/
}

main() {
    reload_reqd=false
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
    shrc_fixup "$PWD" || die "104"
    completion_fixup "$PWD" || die  "103"
    make_aliases "$PWD" || die "105"
    $reload_reqd && echo "Shell reload required ('bash -l')" >&2
}

[[ -z $sourceMe ]] && main "$@"
