# localhist
#
#   localhist -v|--version
#   localhist [o]n       # Set HISTFILE to <current dir>/bash_history
#   localhist of[f]      # Switch HISTFILE back to ~/bash_history
#   localhist [j]oin     # Join by searching up in tree for 'bash_history'
#   localhist [cd]       # Change dir to parent of HISTFILE
#   localhist [r]ead     # Read from current HISTFILE to buffer
#   localhost [ann]otate # Edit recent events
#   localhist [s]how     # Show status
#   localhist [d]ump     # Dump current histfile
#   localhist [d]ump -c  # Dump current histfile, comments only
#   localhist [e]dit     # Load current history buffer into $EDITOR
#   localhist [i]mport   # Read from file(s) into buffer
#   localhist [c]lear    # Clear buffer only
#   localhist c[l]ean    # Clean current HISTFILE, removing unworthy stuff
#   localhist [mem]clean # Clean current memory buffer removing unworthy stuff
#   localhist [arch]ive  # Archive and clean $HISTFILE
#   localhist git[sync]  # Run git sync on wc root of $LH_ARCHIVE
#   localhist co[m]pare  # Compare current HISTFILE with ~/.bash_history
#   localhist [z]merge   # Merge one or more file args into HISTFILE
#   localhist [g]rep     # Search all ~/.localhist/* registered files
#   localhist [g]rep -a  # Search all LH_ARCHIVE/HOST files
#   localhist ca[t]alog  # Print stats on all ~/.localhist registered files
#   localhist e[x]port   # Write buffer to specific file, with edit option
#   localhist [w]rite    # Write buffer to current HISTFILE
#   lo             : : : :  E x a m p l e s   : : : :
#   localhist on read    # Turn on, then read.
#   localhist o r        # ... same thing, fewer letters
#   localhist r l w      # Read, cLean, Write
#   localhost w l m      # Write, cLean, coMpare with ~/.bash_history


lh_stub() {
    echo -e "\033[;33m   lh_stub[$@]\033[;0m" >&2
}

histevent_count() {
    [[ -f $1 ]] || { echo 0; return; }
    ( grep -vE '^#[0-9]+' ${1} 2>/dev/null || :) | wc -l
}

localhist_join() {
    # Search up thru parent dirs to find nearest 'bash_history' (no dot),
    # and set HISTFILE to that path.  Typically such files are per-project
    # bound.
    local orgDir=$PWD
    while true; do
        if [[ -f bash_history ]]; then
            localhist_register ${PWD}/bash_history
            [[ $HISTFILE == ${PWD}/bash_history ]] && {
                echo "No join needed: HISTFILE is already $HISTFILE";
                return;
            }
            localhist_set $PWD/bash_history
            echo "Ok I found and set HISTFILE to $HISTFILE"
            cd $orgDir
            return
        fi
        if [[ $PWD == '/' ]]; then
            echo "I can't find a parent bash_history, HISTFILE is still $HISTFILE"
            cd $orgDir
            false
            return
        fi
        cd ..
    done
    cd $orgDir
}
localhist_set() {
    # HISTFILE_PRESERVE allows restore our HISTFILE across shell init:
    if [[ $1 != $HISTFILE ]]; then
        export HISTFILE_PREV=$HISTFILE
        (
            #HISTFILE=$HOME/.bash_history;
            HISTFILE=( bash --rcfile $HOME/.localhistrc -c 'echo $HISTFILE')
            builtin history -s "HISTFILE=$1  # Switching from $HISTFILE_PREV";
            builtin history -a
        )
        HISTFILE=$1
    fi
    export HISTFILE_PRESERVE=$1
}

help_highlight() {
    local line
    local lx
    while read line; do
        if [[ $line == *loc* ]]; then
            lx=$(builtin echo "$line" | command sed 's/\[/[\\033[;35m/' | command sed 's/]/\\033[;0m]/')
        else
            lx="\033[;32m${line}\033[;0m"
        fi
        echo -e "$lx"
    done
}

localhist_register() {
    # Maintain ~/.localhist symlink registry
    local filename=$(readlink -f "$1" 2>/dev/null)
    [[ -f $filename ]] || { false; return; }
    if [[ ! -d $HOME/.localhist ]]; then
        mkdir -p $HOME/.localhist &>/dev/null
        ln -sf $HOME/.bash_history "$HOME/.localhist/HOME^.bash_history"
    fi
    local linkname="${filename//[\/]/^}"
    ln -sf "${filename}" $HOME/.localhist/${linkname}  &>/dev/null
}

localhist_export_help() {
    # Set up context and invoke localhist_export.sh
    (
        [[ -x ${LocalhistHome}/localhist-merge.sh ]] || { echo "ERROR: can't find ${LocalhistHome}/localhist-merge.sh" >&2; exit 1; }
        HISTFILE=$(mktemp)
        [[ -z ${HISTFILE} ]] && exit 1;
        trap 'command rm -f $HISTFILE' exit
        builtin history -w
        ${LocalhistHome}/localhist-merge.sh --edit $HISTFILE -o "$@"
        [[ $? -eq 0 ]] && echo "Ok I merged buffer into $@"
    )
}

localhist_memclean() {
    local -r tmpfile=$(mktemp)
    local -r orig_histfile=$HISTFILE
    [[ -z ${tmpfile} ]] && return
    trap "command rm -f $tmpfile &>/dev/null; HISTFILE=${orig_histfile};" return
    HISTFILE=${tmpfile}
    builtin history -w
    ${LocalhistHome}/localhist-cleanup.sh $HISTFILE
    builtin history -c
    builtin history -r
    echo "Ok: I cleaned history in buffer"
}

localhist_clean_files() {
    local fn out_fn
    for fn in "$@"; do
        out_fn=$(mktemp)
        ${LocalhistHome}/localhist-cleanup.sh "$fn" > ${out_fn}
        [[ -f $out_fn ]] && command cat $out_fn > "${fn}"
    done
}

localhist_import_files() {
    # Import files in $@.  If empty, default to current dir bash_history
    [[ $# == 0 ]] && set -- ./bash_history
    local imported_files=()
    local orig_histfile=$HISTFILE
    for arg in "$@"; do
        local srcfile=$(readlink -f $1)
        shift
        [[ -r $srcfile ]] || { echo "ERROR: Can't find/read $srcfile\n"; continue; }
        HISTFILE=$srcfile
        builtin history -r || { echo "ERROR loading $srcfile"; continue; }
        imported_files+=( ${arg} )
    done
    HISTFILE=$orig_histfile
    printf "OK: I imported ${imported_files[@]}\n"
}

localhist_help() {
    [[ -r $LocalhistHelpRendered ]] && { echo -ne "$(<${LocalhistHelpRendered})"; echo; return; }
    LocalhistHelpRendered=$(mktemp) # This rendering is noticeably slower the first time thru, thus
                                    # the tmpfile cache...
    egrep '^#   l' ${LocalhistHome}/localhist-core.bashrc | cut -c 3- | help_highlight | tee ${LocalhistHelpRendered}
}


localhist_annotate_inner() {
    # Used to add comments or modify history after the fact
    local -a recent_hist
    mapfile -t recent_hist < <( builtin fc -ln -25 | sed 's/^[\t ]*//' )
    local i entrykey entryidx edited entry
    [[ ${#recent_hist[@]} -eq 0 ]] && { echo "No candidate events" >&2; return 1;}
    local labels=( {0..9} {a..d} {f..p} )
    for i in {0..24}; do
        [[ -z "${recent_hist[$i]}" ]] && break
        builtin echo -e "\033[;31m${labels[${i}]}\033[;0m: ${recent_hist[$i]}"
    done
    builtin echo -ne "\033[;33m ? [\033[;31mnumber\033[;33m] <> [\033[;31me\033[;33m]dit \$HISTFILE <> [\033[;31mq\033[;33m]uit\033[;0m: "
    builtin read -n 1 entrykey
    builtin echo
    [[ ${entrykey} =~ [qQ] ]] && { return 1; }
    [[ ${entrykey} =~ [eE] ]] && { localhist edit; return 0; }
    for entryidx in {0..24}; do
        [[ ${entrykey} == ${labels[$entryidx]} ]] && break
    done

    entry=${recent_hist[$entryidx]}
    builtin read -p "editing(${entrykey}): " -ei "${entry}" edited
    [[ -z ${edited} ]] && return 0
    builtin history -s "${edited}"
    [[ "${edited}" != "${entry}" ]] && printf "OK: history updated."
    return 0
}

localhist_annotate() {
    while true; do
        if ! localhist_annotate_inner; then
            return
        fi
    done
}

localhist() {
    [[ -z $1 ]] && { localhist help; echo -en "  \033[;33mNow: -> " ; localhist show; echo -en "\033[;0m"; return; }
    while [[ -n $1 ]]; do
        case $1 in
            -v|--version)
                ${LocalhistHome}/localhist-version.sh
            ;;
            o|on)
                if [[ $HISTFILE == $PWD/bash_history ]] ; then
                    echo Already on
                    localhist show
                elif [[ -f ./.bash_history ]]; then
                    builtin echo "Can't do 'on' when ./.bash_history exists" >&2
                else
                    touch $PWD/bash_history || {
                        builtin echo "Can't create $PWD/bash_history" >&2
                        false; return
                    }
                    localhist_set $PWD/bash_history
                    localhist_register $HISTFILE
                    echo "Ok: I set HISTFILE is $HISTFILE "
                fi
            ;;
            j|join)
                localhist_join "$@"
            ;;
            cd)
                [[ -d $(dirname $HISTFILE) ]] && {
                    cd $(dirname $HISTFILE)
                    } || builtin echo "HISTFILE not set" >&2
            ;;
            f|off)
                if [[ $HISTFILE == $DEFAULT_HISTFILE ]]; then
                    echo Already off
                    localhist show
                else
                    localhist_set $DEFAULT_HISTFILE
                    echo "Ok: I set HISTFILE to $DEFAULT_HISTFILE"
                fi
            ;;
            x|export)
                shift
                localhist_export_help "$@"
                set --
            ;;
            z|merge)
                shift
                ${LocalhistHome}/localhist-merge.sh "$@" -o $HISTFILE
                set --
            ;;
            l|clean)
                localhist_clean_files $HISTFILE
                echo "Ok: cleaned $HISTFILE"
            ;;
            p|append)
                builtin history -a
                echo "Ok: buffered events appended to $HISTFILE"
            ;;
            mem|memclean)
                localhist_memclean
            ;;
            ar|arch|archive)
                ${LocalhistHome}/localhist-archive.sh --login --force || return;
            ;;
            gitsync|sync)
                ${LocalhistHome}/localhist-archive.sh archive-gitsync || return;
            ;;
            r|read)
                builtin history -r
                echo "Ok: I read buffer from $HISTFILE"
            ;;
            i|import)
                shift
                localhist_import_files "$@"
                set --
            ;;
            c|clear)
                builtin history -c
                echo "Ok: I cleared the buffer"
            ;;
            e|edit)
                echo "Editing $HISTFILE:"
                $EDITOR $HISTFILE
            ;;
            a|ann|annotate)
                localhist_annotate
            ;;
            s|show)
                echo "HISTFILE=$HISTFILE: $(histevent_count $HISTFILE ) events, memory: $HISTCMD events"
            ;;
            d|dump)
                ${LocalhistHome}/localhist-dump.sh $2 --file $HISTFILE
                shift
            ;;
            m|compare)
                if [[ $HISTFILE == $DEFAULT_HISTFILE ]]; then
                    echo "ERROR: nothing to compare, we're on $HISTFILE" >&2
                    false
                    return
                elif diff $HISTFILE $DEFAULT_HISTFILE &>/dev/null; then
                    echo "$HISTFILE is not different from $DEFAULT_HISTORY"
                    false
                    return
                fi
                echo "Comparing $DEFAULT_HISTFILE and $HISTFILE:"
                vimdiff $DEFAULT_HISTFILE $HISTFILE
            ;;
            g|grep)
                shift
                ${LocalhistHome}/localhist-grep.sh "$@"
                set --
            ;;
            t|catalog)
                shift
                ${LocalhistHome}/localhist-catalog.sh "$@"
            ;;
            h|help)
                localhist_help
            ;;
            *)
                localhist help
                echo "Error: unknown arg $1" >&2
            ;;

        esac
        shift
    done
}

localhist_add() { # Append a text entry to HISTFILE
    local text_source=stdin  # Use -- to supply text from command line
    local prepend
    local text
    while [[ -n $1 ]]; do
        case $1 in
            -h|--help)
                builtin echo "localhist_add [--comment|-c] [--file|-f <path>] [-- args as text]"
                return
            ;;
            -c|--comment)  # Add text after a '#' comment indicator
                prepend="# "
            ;;
            -f|--file)  # Get text from specified file
                text_source="${2}"; shift
            ;;
            --)  # Anything following is the text itself
                text_source=args
                shift
                break
            ;;
        esac
        shift
    done
    case $text_source in
        stdin)
            if [[ -t 2  && -t 0 ]]; then
                builtin read -p "Enter text for new history event: " text
            else
                builtin read text
            fi
            ;;
        args)
            text="$@"
            ;;
        *)
            [[ -r ${text_source} ]] || { builtin echo "ERROR: can't read text from file \"${text_source}\" " >&2; false; return; }
            text=$(command cat ${text_source} | command tr '\n' ';' )
            ;;
    esac
    builtin history -s "${prepend}${text}"
}

function history_grep {
    builtin history | command grep -E "$@"
    set +f
}

function localhist_prompt_command() {
    # Append to history file.  If we're using a local hist file,
    # cc: the entry to ~/.bash_history also
    [[ -f ${HOME}/.localhistrc ]] && source ${HOME}/.localhistrc
    builtin history -a
    [[ $HISTFILE == $DEFAULT_HISTFILE ]] && return
    [[ -n $DEFAULT_HISTFILE && -n $HISTFILE ]] &&  {
        command tail -n 2 $HISTFILE >> $DEFAULT_HISTFILE
    }
}

localhist_login_hook() {
    shopt -q login_shell && {
        ${LocalhistHome}/localhist-archive.sh --login
    }
}


