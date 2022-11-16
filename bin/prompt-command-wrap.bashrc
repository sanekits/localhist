# prompt-command-wrap.bashrc
# vim: filetype=sh :

# Scripts which use this helper should NOT set PROMPT_COMMAND directly.  Instead,
# they should invoke __pcwrap_register() during shell init, passing the name of
# a function to be called whenever the prompt is being prepared for the user.
#
#  __pcwrap_register maintains a list of such functions, solving the global arguments
# over the single COMMAND_PROMPT value.
#
#  Whenever __pcwrap_register is invoked, it first captures any existing COMMAND_PROMPT and
# adds it to the collection, then replaces COMMAND_PROMPT with __pcwrap_run().
#
#  In case of confusion, use __pcwrap_state() to print the current item list and COMMAND_PROMPT.
#  For debugging, __pcwrap_clear() will zero everything out.
#
__do_define_pcwrap=false
type -t __pcwrap_ver >/dev/null && {
    [[ $(__pcwrap_ver) -lt 4 ]] && {
        __do_define_pcwrap=true
    }
} || {
    # __pcwrap_ver doesn't exist
    __do_define_pcwrap=true
}

$__do_define_pcwrap && {
    unset __do_define_pcwrap
    __pcwrap_ver() {
        builtin echo 4
    }
    [[ -z ${__pcwrap_items+x} ]] && {
        # __pcwrap_items is not yet defined
        builtin declare -g -a __pcwrap_items
    }
    __pcwrap_is_registered() {
        # Return fail if $1 is not registered in __pcwrap_items
        local item
        for item in ${__pcwrap_items[@]}; do
            [[ "${item}" == "$1" ]] && {
                return
            }
        done
        false
    }
    __pcwrap_capture_existing_prompt_command() {
        [[ -z "$PROMPT_COMMAND" ]] && {
            PROMPT_COMMAND=__pcwrap_run;
            return
        }
        [[ "$PROMPT_COMMAND" == __pcwrap_run ]] || {
            local funcId=__pcwrap_synth_${RANDOM}
            eval "$funcId() { \
                $PROMPT_COMMAND ;\
                };"
            __pcwrap_items+=("$funcId")
            PROMPT_COMMAND=__pcwrap_run
        }
    }

    __pcwrap_register() {
        # Register one or more PROMPT_COMMAND functions into __pcwrap_items
        __pcwrap_capture_existing_prompt_command
        while [[ -n $1 ]]; do
            __pcwrap_is_registered "$1" || {
                __pcwrap_items+=("$1")
            }
            shift
        done
    }
    __pcwrap_state() {
        # Debug tool
        declare -p __pcwrap_items >&2
        builtin printf "PROMPT_COMMAND=[$PROMPT_COMMAND]\n" >&2
    }
    __pcwrap_run() {
        local origResultCode=$?  # We want inner commands to know the original command status
        local item
        for item in ${__pcwrap_items[@]}; do
            [[ "$(type -t $item)" == function ]] && {
                [[ $origResultCode -eq 0 ]];
                $item;
            }
        done
        [[ $origResultCode -eq 0 ]];
    }
    __pcwrap_clear() {
        unset __pcwrap_items;
        declare -g -a __pcwrap_items;
        PROMPT_COMMAND=""
        echo "__pcwrap_clear() completed" >&2
    }
    __pcwrap_register
}
