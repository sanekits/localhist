#!/bin/bash
# setup.sh for localhist
#  This script is run from a temp dir after the self-install code has
# extracted the install files.   The default behavior is provided
# by the main_base() call, but after that you can add your own logic
# and installation steps.

canonpath() {
    builtin type -t realpath.sh &>/dev/null && {
        realpath.sh -f "$@"
        return
    }
    builtin type -t readlink &>/dev/null && {
        command readlink -f "$@"
        return
    }
    # Fallback: Ok for rough work only, does not handle some corner cases:
    ( builtin cd -L -- "$(command dirname -- $0)"; builtin echo "$(command pwd -P)/$(command basename -- $0)" )
}

stub() {
   builtin echo "  <<< STUB[$*] >>> " >&2
}
scriptName="$(canonpath  $0)"
scriptDir=$(command dirname -- "${scriptName}")

source ${scriptDir}/shellkit/setup-base.sh

die() {
    builtin echo "ERROR(setup.sh): $*" >&2
    builtin exit 1
}

install_localhistrc() {
    [[ -f ~/.localhistrc ]] && {
        diff ~/.localhistrc ${Kitname}/localhistrc.template &>/dev/null || {
            cp ${Kitname}/localhistrc.template ~/.localhistrc.proposed
            echo "WARNING: your ~/.localhistrc differs from the packaged version.  You should compare it with ~/.localhistrc.proposed to get the latest changes." >&2
        }
        true
    } || {
        cp ${Kitname}/localhistrc.template ~/.localhistrc
    }
    [[ -f ~/.localhist-hostname ]] || {
        hostname > ~/.localhist-hostname 2>/dev/null || {
            cat /etc/hostname > ~/.localhist-hostname || {
                echo "unk-host" > ~/.localhist-hostname
            }
        }
    }
    (
        source ~/.localhistrc
        [[ -n $DEFAULT_HISTFILE ]] && {
            touch $DEFAULT_HISTFILE
        } || die "DEFAULT_HISTFILE is not set in ~/.localhistrc"
        [[ -n $LH_ARCHIVE ]] && {
            mkdir -p $LH_ARCHIVE
        } || echo "WARNING: LH_ARCHIVE is not defined in ~/.localhistrc"
    ) || die
}

completion_fixup() {
    # Setup ~/.bash_completion.d/localhist-completion.bash.  The
    # completion logic in bash searches this dir.
    mkdir -p $HOME/.bash_completion.d
    ln -sf ${HOME}/.local/bin/${Kitname}/localhist-completion.bash $HOME/.bash_completion.d/
}


get_HISTFILE_default() {
    # Whatever .localhistrc says is authoritative about the default histfile
    DEFAULT_HISTFILE=$( bash --rcfile $HOME/.localhistrc -c 'echo $HISTFILE')
    echo $DEFAULT_HISTFILE
}

main() {
    Script=${scriptName} main_base "$@"
    builtin cd ${HOME}/.local/bin || die 208

    install_localhistrc
    completion_fixup

    # FINALIZE: perms on ~/.local/bin/localhist.  We want others/group to be
    # able to traverse dirs and exec scripts, so that a source installation can
    # be replicated to a dest from the same file system (e.g. docker containers,
    # nfs-mounted home nets, etc)
    command chmod og+rX ${HOME}/.local/bin/${Kitname} -R
    command chmod og+rX ${HOME}/.local ${HOME}/.local/bin
    true
}

[[ -z ${sourceMe} ]] && {
    main "$@"
    builtin exit
}
command true
