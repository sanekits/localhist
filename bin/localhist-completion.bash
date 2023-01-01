# localhist_completion.bash

# _StubTty=${_StubTty:-/dev/null}
# [[ -n _StubCnt ]] || _StubCnt=0

# _stub_lh_comp () {
#     local dest=${_StubTty}
#     (( _StubCnt++ ))
#     echo -n ">>_stub_lh_comp[$_StubCnt]: " >$dest
#     printf "<%s> " "$@" >$dest
#     echo $'\n' >$dest
# }

_localhist_commands() {
    local all="help --version archive import join config-edit gitsync clear memclean"
    echo -n "${all}"
    if [[ -n $HISTFILE ]]; then
        echo "on cd write export read show dump edit clean grep"
    else
        echo
    fi
}

_localhist_completion() {
    local cmd prev opts
    #_stub_lh_comp ">>>>  ENTRY >>>>"
    COMP_REPLY=()
    cmd="${COMP_WORDS[0]}"
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    #_stub_lh_comp cmd= "$cmd" cur= "$cur" prev= "$prev" opts= "$opts"

    case $prev in
        import)
           COMPREPLY=( $(compgen -o default -f -- "${cur}" ) );; # Pick a file...
        *)
            opts="$(_localhist_commands)"
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") );;
    esac
    #_stub_lh_comp "<<<< EXIT <<<<"
    return 0
}

complete -F _localhist_completion localhist
complete -F _localhist_completion lh

