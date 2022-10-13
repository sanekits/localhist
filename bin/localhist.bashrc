# vim: filetype=sh
# localhist.bashrc - shell init file for localhist sourced from ~/.bashrc

localhist-semaphore() {
    [[ 1 -eq  1 ]]
}

export LocalhistHome=${HOME}/.local/bin/localhist

source ${LocalhistHome}/localhist-core.bashrc

__pcwrap_register  localhist_prompt_command

localhist_login_hook
