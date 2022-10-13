# vim: filetype=sh
# localhist.bashrc - shell init file for localhist sourced from ~/.bashrc

localhist-semaphore() {
    [[ 1 -eq  1 ]]
}

export LocalhistHome=${HOME}/.local/bin/localhist

source ${LocalhistHome}/localhist-core.bashrc

[[ -f ${LocalhistHome}/prompt-command-wrap.bashrc ]]  \
    && source ${LocalhistHome}/prompt-command-wrap.bashrc

[[ -f ${HOME}/.localhistrc ]] && source ${HOME}/.localhistrc
[[ -n $DEFAULT_HISTFILE ]] && [[ $DEFAULT_HISTFILE != ~/.bash_history ]] && [[ $HISTFILE == ~/.bash_history ]] && {
    # User wants a different default histfile than bash, so we force it:
    HISTFILE=$DEFAULT_HISTFILE
}

[[ -n $LH_ARCHIVE ]] && [[ ! -d $LH_ARCHIVE ]] && {
    command mkdir -p "$LH_ARCHIVE"
}

__pcwrap_register  localhist_prompt_command

localhist_login_hook
