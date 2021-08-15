# localhist_completion.bash

_localhist_commands() {
    echo -e "help on join write export read import off show dump edit clear clean memclean compare merge grep catalog"
}

_localhist_completion() {
    COMPREPLY=( $(compgen -W "$(_localhist_commands)" "${COMP_WORDS[${COMP_CWORD}]}" ) )
}

complete -F _localhist_completion localhist
complete -F _localhist_completion lh

