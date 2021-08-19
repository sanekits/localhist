#!/bin/bash
# :vim filetype=sh :
# localhist-merge.sh
#  Merges input file(s) with output file such that dupes are removed and timestamps ordered correctly
#  Input files must exist.
#  If no output file is specified, stdout is assumed
#  If no input file(s) are specified, stdin is assumed

canonpath() {
    ( cd -L -- "$(dirname -- $0)"; echo "$(pwd -P)/$(basename -- $0)" )
}

Script=$(canonpath "$0")
Scriptdir=$(dirname -- "$Script")
Scriptname=$(basename $Script)

LOCALHIST_EDITOR=${LOCALHIST_EDITOR:-$EDITOR}
[[ -n $LOCALHIST_EDITOR ]] || LOCALHIST_EDITOR=vim


red() {
    /bin/echo -en "\033[;31m$@\033[;0m"
}
green() {
    /bin/echo -en "\033[;32m$@\033[;0m"
}
yellow() {
    /bin/echo -en "\033[;33m$@\033[;0m"
}
stubstate() {
    red "${input_files[@]@A}, ${output_file@A}, ${edit_mode@A}\n" # stub
    (( $# > 0 )) && red "  ($@)\n"
}

stub() {
    yellow "  stub[$@]\n"
}
die() {
    red "$@\n" >&2
    exit 1
}
die_help() {
    echo "Usage: $Scriptname [input_file [input_file]] [-o output_file] [-e|--edit]"
    echo "  --edit invokes \$EDITOR with temp copies of all input files passed in "
    echo "    order, so user can modify the merge sources before applying them."
    die "$@"
}

parseArgs() {
    input_files=()
    output_file=/dev/stdout
    edit_mode=false
    until [[ -z $1 ]]; do
        #yellow "stub1[$1]\n"
        case $1 in
            -e|--edit)
                edit_mode=true
                ;;
            -o|--output)
                output_file=$2
                shift
                ;;
            *)
                if [[ -f $1 ]]; then
                    input_files+=("$1")
                else
                    die_help "Can't find input file $1"
                fi
                ;;
        esac
        shift
    done
    if [[ -z $output_file ]]; then
        output_file=/dev/stdout
    fi
}


merge_edit() {
    #  Expecting: output_file input_files[]
    local outfile="$1"; shift
    local impfiles="$@"
    input_tmpfiles=()
    trap 'rm "${input_tmpfiles[@]}"' exit
    yellow "Edit-merging ${#impfiles[@]} input file(s) into -> ${outfile}: \n"
    for xf; do
        t0=$(mktemp)
        cat "${xf}" > "${t0}"
        input_tmpfiles+=( "${t0}" )
    done
    $LOCALHIST_EDITOR "${input_tmpfiles[@]}" || die
    cat "${input_tmpfiles[@]}" >> "${outfile}"
    # stub "merge_edit ${inpfiles[@]}"
    # stub "merge_edit ${input_tmpfiles[@]}"
    # stub "merge_noedit ${outfile}"
    localhist-cleanup.sh "${outfile}"
}

merge_noedit() {
    #  Expecting: output_file input_files[]
    local outfile="$1"; shift
    yellow "Merging $# input file(s) into -> ${outfile}: \n"
    local inpfiles="$@"
    for xf in ${inpfiles[@]}; do
        echo "  <- ${xf}"
    done
    cat ${inpfiles[@]} >> "${outfile}"
    histfile-cleanup.sh "${outfile}"
}

backup_original() {
    for arg; do
        [[ -r ${arg} ]] || { red "Warning: can't back up unreadable or unknown file ${arg}\n"; continue; }
        cp ${arg} ${arg}.bak
    done
}

if [ -z "$sourceMe" ]; then
    parseArgs "$@"
    #stubstate post parse

    backup_original ${output_file}
    if $edit_mode; then
        merge_edit "${output_file}" "${input_files[@]}"
    else
        merge_noedit "${output_file}" "${input_files[@]}"
    fi
fi
