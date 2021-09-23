#1629745064
cd /c/Projects/elt-classmgr.workspace # to class
#1629804012
# Improve path_undupe.py and path_undupe shell script.  What we want is a quick detection of dupes, emit a message, and then provide a simple means for user to de-dupe the path or at least know which path members are dupe
#1629804231
cd ~/bin; python3.8 -i path_undupe.py --list-dupes # test rp1
#1629804836
cd ~/bin; loop python3.8  path_undupe.py --unique #
#1629806784
source path_undupe.bash; path_undupe # Testing path_undupe
#1629807360
gpa "Rework path_undupe.{bash,py}" #
#1629809363
cd /c/Projects/elt-classmgr.workspace/mar22 # to class
#1629826018
cd /c/Projects/revision-control.workspace/trnma.revision-control # to revision
#1629829518
# Prepping to teach aug23 revision-control
#1629829583
# /c/Projects/revision-control.workspace/trnma.revision-control
#1629829695
# We're using labspace/ as a demo area with autosync bash_history
#1629886331
cd /c/Projects/revision-control.workspace/labspace # to revis
#1629886438
cd /home/lmatheson4/bin/tox-py # to tox
#1629886438
cd /c/Projects/zap_container # to zap
#1629886438
vim cdpath.taskrc # We want to define cdpath_add()
#1629886438
cd /c/Projects/progress-metrics.workspace # to prog
#1629886438
cd /c/Projects/riddle/1pp # to 1pp
#1629886438
cd /c/Projects/booktools # to book
#1629886438
docker run -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 # Testing localhist setup
#1629886438
cd /c/Projects/unix.workspace/trnma.unix # to unix
#1629886438
cd /c/Projects/explore/dpkg/localhist/workspace # to dpkg
#1629886438
cd /c/Projects/explore/dpkg # to dpkg
#1629886438
cd /c/Projects/dev-environment.workspace/trnma.dev-environment # to de
#1629886438
cd /c/Projects/docker.workspace # to dock
#1629886438
cd /c/Projects/docker.workspace # to dock //
#1629886438
cd /c/Projects/dmp.workspace/trnma.dmp/workshop/publisher/python/2-start-model/sample_solution/trnweisv/debian # to dmp debian
#1629886438
cd /c/Projects/dmp.workspace/trnma.dmp/labs/publisher/1-simple-publisher # to dmp
#1629886438
cd /c/Projects/fsdlm74 # to fsd
#1629886438
cd /c/Projects/explore/dpkg/localhist/localhist-0.8/src # to dpkg
#1629886438
localhist [mem]clean# Clean current memory buffer removing unworthy stuff
#1629886438
localhist c[l]ean   # Clean current HISTFILE, removing unworthy stuff
#1629886438
echo Running tutorial for packaging shell scripts "https://blog.packagecloud.io/eng/2016/12/15/howto-build-debian-package-containing-simple-shell-scripts/" #
#1629886438
cd /c/Projects/explore/bash # to bash
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord # to prog
#1629886438
cd /c/Projects/progress-metrics.workspace/pmpilots/template-reportspecs # to prog 11
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_sys # to prog 1
#1629886438
cd /c/Projects/progress-metrics.workspace # to prog 0
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_sys # to prog
#1629886438
cd /c/Projects/progress-metrics.workspace/pmpilots/template-reportspecs # to prog
#1629886438
d /c/Projects/wsl.HOME/bin-pub/tox-py # to tox
#1629886438
cd /c/Projects/wsl.HOME/bin-pub/tox-py # to tox
#1629886438
cd /c/Projects/progress-metrics.workspace/pmpilots # to prog
#1629886438
cd /c/Projects/wsl.HOME/my-home/landlord-live # to land
#1629886438
tail -f ~/.tox_core.log # How we tail the logfile for tox
#1629886438
cd /c/Projects/progress-metrics.workspace/pmpilots # to pilo
#1629886438
cd /c/Projects/progress-metrics.workspace/tmp/test.tmp # to prog
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_reportserv/pm_reportserv/templates # to prog
#1629886438
echo Hello world # Never heard of -v before, but it echoes commands before execution.  What would be the use case?
#1629886438
IFS=$"|\n" read -a myary <<< "$lx"  # Parsing lx into my array
#1629886438
IFS=$"|\n" read a b c <<< "$lx"  # Here we parse on the bar
#1629886438
lx="aa|bb|cc" # setup for read word-splitting test
#1629886438
printf -v varg "this is my format string: %(%F)T" -1 # More printf goodness: it can create/update a variable with -v, skipping a whole command-substitution
#1629886438
printf "this is my format string: %(%F)T" -1 # printf is underrated: the ability to do all of C printf, plus the %T which takes a -1 for current time, plus the abilty todo echo-style escape sequences?  That's a lot
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord # to land
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord # to landlord
#1629886438
printf "%s:  %d" hello 32  # We've ignored printf too long
#1629886438
foo() {   local a=32; local; } # TIL you can write the locals to stdout with just plain 'local'
#1629886438
foo() {   local -  # Make shell options local!;   set -x  # Now this wont affect caller?;   echo hello; }  # TIL you can local-scope the shell options with "local -"
#1629886438
foo() {   local -  # Make shell options local!;   set -x  # Now this won't affect caller?;   echo hello; }  # TIL you can local-scope the shell options with "local -"
#1629886438
foo() {   local -  # Make shell options local!;   set -x  # Now this won't affect caller?;   echo hello; }
#1629886438
exec -a foobar bash # TIL you can set the arg0 with -a
#1629886438
enable -n echo; echo This is a disk command  # TIL you can disable built-ins!
#1629886438
enable -d echo; echo This is a disk command  # TIL you can disable built-ins!
#1629886438
disable echo; echo This is a disk command  # TIL you can disable built-ins!
#1629886438
shopt -s extdebug; declare -Ff tox_w  # TIL you can print the line/file for a declaration!
#1629886438
continue 2 # TIL that continue also allows nest-depth specification
#1629886438
echo # TIL that it makes sense to override built-in cd with function cd, so that tox_w can be called if cd fails
#1629886438
cd /c/Projects/progress-metrics.workspace/pmpilots/trnma.bas # to prog //
#1629886438
cd /c/Projects/middleware.workspace/kafka # to unix kaf
#1629886438
break 3 # TIL that break can exit from nested control sections
#1629886438
source dockershell_completion.bash arg1 arg2  # Never realized that the positional args are set during a source.  This could be useful for tools like taskrc
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord # to landl
#1629886438
export _cstb_term=/dev/pts/2 # wfl
#1629886438
source /home/lmatheson4/bin/tmuxw_completion.bash # lfw
#1629886438
cd /home/lmatheson4/.taskrc # to task
#1629886438
HISTFILE=/home/lmatheson4/.bash_history  # Switching from /home/lmatheson4/bash_history
#1629886438
source  /c/Projects/explore/bash/_dothis_completions.bash # reload tv1
#1629886438
source ~/bin/localhist_completion.bash # tv2
#1629886438
echo ${#DIRSTACK[@]}
#1629886438
_cstb_term=/dev/pts/11 # set debug terminal for tv1
#1629886438
PATH="$PATH:$PWD"  # just testing dothis
#1629886438
complete -F _dothis_completions dothis # Register tv1
#1629886438
. /c/Projects/explore/bash/_dothis_completions.bash # reload tv1
#1629886438
_cstb_term=/dev/pts/17 # set debug terminal for tv1
#1629886438
compgen -W "now tomorrow never" nev # Trying to understand compgen
#1629886438
compgen -W "now tomorrow never"  # Trying to understand compgen
#1629886438
_dothis_completions()  {   COMPREPLY+=("now");   COMPREPLY+=("tomorrow");   COMPREPLY+=("never"); };  # tv1
#1629886438
echo # Just understanding the "complete -F" output is half the job, if you can borrow the completion logic of an existing function you can wrap it or reuse it
#1629886438
complete -p # List all completions
#1629886438
complete -r dothis  # It can take multiple -r's to remove a completion if it was added more than once
#1629886438
complete -A function dothis # How to supply function names
#1629886438
complete -A file dothis # How to supply file names as completion options
#1629886438
dothis .vscode/ # demo of dir
#1629886438
complete -A directory dothis # How to supply dir names as completion options
#1629886438
function dothis {    echo "dothis invoked with $@"; }  # For testing bash completion
#1629886438
complete -W "now tomorrow never" dothis  # If the completion possibilities are simple, a -W can just list them
#1629886438
shopt -s progcomp  # TIL that Ctrl+R Ctrl+R recalls most-recently searched term!
#1629886438
shopt | grep sourcepath # TIL that sourcepath opt is why I can source files on the PATH
#1629886438
shopt -u progcomp  # turning off programmable completion
#1629886438
cd /c/Projects/unix.workspace/trnma.unix/examples/dotfiles # to unix
#1629886438
PS1="\#"
#1629886438
vv+=(13)  # Adding a new value to end of array 'vv'
#1629886438
echo "${vv[@]}" # dump
#1629886438
/home/lmatheson4/bin/localhist-merge.sh ^c^Projects^dmp.workspace^bash_history ^c^Projects^elt-classmgr.workspace^may24^bash_history -o /tmp/foohist  # t3
#1629886438
/home/lmatheson4/bin/localhist-merge.sh ^c^Projects^dmp.workspace^bash_history ^c^Projects^elt-classmgr.workspace^may24^bash_history -o /tmp/foo  # t2
#1629886438
/home/lmatheson4/bin/localhist-merge.sh ^c^Projects^dmp.workspace^bash_history ^c^Projects^elt-classmgr.workspace^may24^bash_history /tmp/foo  # t2
#1629886438
echo ${${#}}
#1629886438
echo ${#}
#1629886438
localhist-merge.sh # t2
#1629886438
CDPATH=:~:/c/Projects # cdpath simple
#1629886438
for vv in {0..99}; do echo -en "\033[;${vv}m${vv}|"; done  # one-line colorchart
#1629886438
hisg \#
#1629886438
[[ hello -ef bash_history ]]; echo $?  # Compare inodes for equality!
#1629886438
[[ hello -ef hello2 ]]; echo $?  # Compare inodes for equality!
#1629886438
[[ hello -ot bash_history ]]; echo $?  # Did you know that modification times can be compared with -nt and -ot ??
#1629886438
[[ hello -nt bash_history ]]; echo $?  # Did you know that modification times can be compared with -nt and -ot ??
#1629886438
type -a [  # Actually [ is a built-in as well as ext command
#1629886438
declare -i vv=0x1000; (( vv >> 3 )); echo $vv  # And hex values
#1629886438
declare -i vv=32; (( vv %= 10 )); echo $vv  # And modulo-arithmetic?
#1629886438
declare -i vv=32; (( vv >>= 2 )); echo $vv  # did you know that C-style bit math is done?
#1629886438
for vv; do echo -en "\033[;${vv}m${vv}|"; done  # How to make a quick-and-dirty color chart!
#1629886438
shopt -s expand_aliases  # TIL that it's possible to expand aliases in a shell script!
#1629886438
alias ss='( echo "hello"; read -p "u haz question?"; )'  # You have underestimated aliases
#1629886438
echo $(<hello)  # Did not know you could use this instead of 'cat hello'
#1629886438
echo ${!B*}  # Print all vars that start with B
#1629886438
echo ${!HIST*}  # Print all vars that start with HIST
#1629886438
echo ${vc:=39}  # You can set the variable default this way.  If vc is defined, it will be used, otherwise 32 will be assigned
#1629886438
echo ${vc:=32}  # You can set the variable default this way.  If vc is defined, it will be used, otherwise 32 will be assigned
#1629886438
xx=PATH; echo ${!xx}  # Bet you didn't know that variables can be indirect like this
#1629886438
xx=PATH; echo #{!xx}  # Bet you didn't know that variables can be indirect like this
#1629886438
HISTFILE=/home/lmatheson4/.bash_history  # Switching from t1
#1629886438
cd /c/Projects/unix.workspace/trnma.unix/examples/dotfiles # to unix //
#1629886438
cd /c/Projects/dmp.workspace/trnma.dmp/labs/publisher/1-simple-publisher # to trnma
#1629886438
ls ~-  # this is worth practicing, so you can ls the old dir
#1629886438
echo ~- # An alias for OLDPWD
#1629886438
echo ~+ # An alias for $PWD
#1629886438
for vv; do echo -en "\033[${vv};30m${vv}|"; done  # Variation
#1629886438
for vv; do echo -en "\033[${vv};0m${vv}|"; done  # Variation
#1629886438
echo {z..a}  # You can do this backwards also
#1629886438
echo {01..109} # If you add a leading 0, all results have the same width
#1629886438
echo {a..z..3} # Expand from a to z skipping 3 chars
#1629886438
cd /home/lmatheson4/bin # to bin // 0
#1629886438
echo \${1..10} # Creates $1 $2 $3...
#1629886438
echo \${1..10}  # Creates $1 $2 $3...
#1629886438
set -- {1..10}  # positional args
#1629886438
echo {1..10} # You forgot all about sequence expansion: here's 10 digits
#1629886438
vcol=( col{red,green,blue} )  # Example of non-file brace expansion
#1629886438
echo myfile.{py,c,o}  # Remember brace expansion?  It doesn't have to refer to files
#1629886438
var=( $* ) # TIL you can init an array like this
#1629886438
var=( $* )  # TIL you can init an array like this
#1629886438
var[2]=world # TIL you can just make up array vars on the fly if you use brackets!
#1629886438
set -- "${var[@]}" # Expand var into multiple args
#1629886438
set -- "${var[*]}" # Expand var into $1
#1629886438
gpa Improves ELT-class-setup.md #
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord # to landlo
#1629886438
cd bin # to bin
#1629886438
cd /c/Projects/guts.workspace # to guts
#1629886438
localhist-catalog.sh # t1
#1629886438
chmod +x ~/bin/localhist-catalog.sh # Let's have a way to catalog the .localhist content
#1629886438
cd /home/lmatheson4/bin # to bin 0 //
#1629886438
cd /home/lmatheson4/bin # to bin //
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_reportserv/pm_reportserv/templates/auto_heatmap # to prog
#1629886438
grep -Ev '^#[0-9]+' $HISTFILE | wc -l
#1629886438
grep -Ev '^#\d+' $HISTFILE | wc -l
#1629886438
grep -Ev '^#' $HISTFILE | wc -l
#1629886438
grep -Ev '^#' $HISTFILE
#1629886438
HISTFILE=/home/lmatheson4/.bash_history  # Switching from ^c^Projects^bedtime-bound^bash_history
#1629886438
echo "# Working the shell parameter expansion examples in https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion"
#1629886438
va=(1 2 3 4 5 6 7 8 9 a b c d e f g h) # make an array 'va'
#1629886438
cd /c/Projects/explore # to explo
#1629886438
set -- 1 2 3 4 5 6 7 8 9 a b c d e f g h # lots of positional params
#1629886438
set -- "hello world"  # Set positional args
#1629886438
echo $#
#1629886438
sudo apt install groff # install groff so we can use "man -Tpdf".  The default installation was just groff-base"
#1629886438
sudo apt install groff # install groff so we can use "man -Tpdf"
#1629886438
HISTFILE=/c/Projects/dmp.workspace/bash_history # Switching from /home/lmatheson4/.bash_history
#1629886438
HISTFILE=/home/lmatheson4/.bash_history  # Switching from /c/Projects/progress-metrics.workspace/pm_reportserv/bash_history
#1629886438
HISTFILE=/home/lmatheson4/.bash_history # Switching from /c/Projects/progress-metrics.workspace/pm_reportserv/bash_history
#1629886438
HISTFILE=/home/lmatheson4/.bash_history # Switching from /home/lmatheson4/.bash_history
#1629886438
cd /c/Projects/unix.workspace # to unix
#1629886438
lc -i roster remove aug9-roster # Use roster file to load trainee idents
#1629886438
lc -i roster remove tmp/aug9-roster # Use roster file to load trainee idents
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord/landlord/libexec # to landlo
#1629886438
lc -i trainee add - # Paste column of trainee data into trainee-add
#1629886438
cat | xargs landcli roster add $toms_class # Paste column of trainee data into roster-add
#1629886438
cd /c/Projects/tmp1/heather # to tmp
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord/landlord/libexec # to landl
#1629886438
cd /home/lmatheson4/tmp # to tmp
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord/landlord/libexec # to libex
#1629886438
vim rosters.taskrc # Add Tom's new Aug 9 class
#1629886438
cd /home/lmatheson4/journal # to jour
#1629886438
curl http://artprod.dev.bloomberg.com/artifactory/bb-public-bucket-local/tdoc/landlord/v0.6.2/setup-landlord.sh | sh - # Setup landlord v0.6.2
#1629886438
cd /c/Projects/middleware.workspace/trnma.middleware-overview/labs/kafkachat # to kaf
#1629886438
cd /c/Projects/middleware.workspace/kafka # to kaf
#1629886438
cd /c/Projects/middleware.workspace/kafka.docker/kafka # to kafk
#1629886438
git reset --hard jun28/master # middleware teach prep
#1629886438
cd /c/Projects/middleware.workspace/trnma.middleware-overview # to middl
#1629886438
cd /c/Projects/middleware.workspace/trnma.middleware-overview # to middle
#1629886438
cd /c/Projects/middleware.workspace/trnma.middleware-overview # to middl //
#1629886438
dc exec trndmpsv basclient -x trndmpsv.xsd --uuid 1 requests/add-city-lu.json # Test lab7 add-city
#1629886438
cd /c/Projects/dmp.workspace/trnma.dmp/labs/publisher-advanced/7-bas-dmp/solution # to 7
#1629886438
cd /c/Projects/dmp.workspace/trnma.dmp/labs/publisher/1-simple-publisher # to dmp //
#1629886438
/c/Projects/guts.workspace/guts-flow-gist # This is for having the guts network team help with presentation Aug 3
#1629886438
cd /c/Projects/guts.workspace/trnma.metrics # to metr //
#1629886438
cd /c/Projects/progress-metrics.workspace/landlord # to metrics
#1629886438
./training_repos_copier.py create rosters/jun28.cfg dmp # Rebuild dmp repo for jun28
#1629886438
/c/Projects/training_repos_copier_workspace/trna.training_repos_copier/training_repos_copier.py makeconfig > rosters/jun28.cfg # Create a dummy cfg for abids class
#1629886438
./training_repos_copier.py create rosters/jun28.cfg # Rebuild dmp repo for jun28
#1629886438
echo ./training_repos_copier.py rosters/jun28.cfg remove dmp # Drop the old dmp
#1629886438
echo /c/Projects/training_repos_copier_workspace/trna.training_repos_copier/training_repos_copier.py makeconfig > rosters/jun28.cfg # Create a dummy cfg for abids class
#1629886438
cd /home/lmatheson4/journal # to jour lc --down exec bash ls -al wsl -l -v wsl.exe -l -v exit cd /mnt/c ls pwd cd ls -a ls -al ls .bashrc ls -al .bashrc exec bash ls -al .profile .bash_profile uname uname -a source .bashrc source ~/.bashrc pwd -P ls -al .bashrc source bin/bashrc-common cd bin cd /c/Projects ls -al exit
#1629886438
echo ${DIRSTACK[@]} # This is "how to extract the value of an array variable"
#1629886438
mkdir i-want-this-dir-to-exist # this is how we create dirs
#1629886438
mv something-else i-meant-to-say-this # This is how we rename or move a file or dir
#1629886438
cp -r trnfolsv something-else # this is how we copy a whole dir
#1629886438
pushd ~ # Change to this dir, and "push" the current dir onto a stack
#1629886438
push ~ # Change to this dir, and "push" the current dir onto a stack
#1629886438
brew install tree # This is how we install software on mac
#1629886438
sudo apt-get install tree # This is how we install software on wsl
#1629886438
man bash # the man command runs man(uals) for a given command
#1629886438
which kafkacat # Find kafkacat
#1629886438
< taskrc.md tr '#' '_' # This is how we can redirect the input to a program (tr in this case)
#1629886438
< taskrc.md tr '#' '_'
#1629886438
tr '#' '_'
#1629886438
( cd foonot ; echo hello ) &>/dev/null # Output both error and standard in one command
#1629886438
( cd foonot ; echo hello 1>/dev/null ) # Output both error and standard in one command
#1629886438
( cd foonot 2>/dev/null; echo hello ) # Output both error and standard in one command
#1629886438
( cd foonot ; echo hello ) # Output both error and standard in one command
#1629886438
myfunc() { local arg1=$1; local arg2=$2; shift 2; local arg_remaining="$@"; echo "arg1=$arg1"; echo "arg2=$arg2"; echo "args_remaining=$@"; } # Defining a function which takes arguments
#1629886438
uname -a # What kind of unix is this?
#1629886438
uname # What kind of unix is this?
#1629886438
echo $mystuff # Now we can see what the subshell said
#1629886438
mystuff=$( cd /; ls ) # Capture that dir list as a variable named mystuff
#1629886438
( cd / ; ls ) # Do that same looking at root files without changing current dir
#1629886438
echo $$; bash # Launch subshell
#1629886438
cd /c/Projects/dmp.workspace/trnma.dmp/labs/publisher/1-simple-publisher # to pub
#1629886438
.3 # Go up 3 levels
#1629886438
cd - # Return to previous dir
#1629886438
pwd -P # What dir am I in?
#1629886438
autocommit_run.sh -p 10 # sync unix github bash_history
#1629886438
./autocommit_run.sh -p 10 # sync unix github bash_history
#1629886438
echo Wednesday morning #
#1629886438
type -a help # What sort of thing is 'help'
#1629886438
loop_hello() { while true; do echo hello world; sleep 3; done; } # This is how we define a function
#1629886438
type -a loop_hello # What type of thing is loop_hello
#1629886438
alias ls='ls --color=auto' # This is how we define an alias
#1629886438
unalias ls # This removes the alias 'ls'
#1629886438
type -a ls # How we find out what type of command something is
#1629886438
ls | grep index # List files, throw out anything that doesn't contain 'index'
#1629886438
echo $PATH # The PATH is a very important built-in variable which defines the list of directories used to search for programs
#1629886438
bash # Create another child
#1629886438
export i # This is how the parent gives access to i for a child shell
#1629886438
bash # create child shell
#1629886438
echo $i # In the parent shell, this is defined
#1629886438
echo $i # this is how we read a variable to the screen
#1629886438
i=3 # Set variable i = 3 do not use spaces around the =
#1629886438
ls -alrt # All files, sorted in reverse-time order
#1629886438
touch dumfile # use the touch command to create a new empty file
#1629886438
cd # all by itself, this goes to HOME dir
#1629886438
help history # Getting help for the shell history
#1629886438
cat $HISTFILE # Show me what's in the hist file
#1629886438
history # Show me my in-memory history
#1629886438
cat $HISTFILE # Show me what is in the history file, which may be different than what's in memory
#1629886438
echo $HISTFILE # Show me the path of the history file for my shell
#1629886438
ls -al # List all the files in this dir, long format
#1629886438
git fetch jun28 && gco master && git reset --hard jun28/master # Setup dmp for jun28
#1629886438
cd /c/Projects/unix.workspace/trnma.unix/examples/dotfiles # to unix 2
#1629886438
cd tmp/unix-jul12-autogist # to unix
#1629886438
cd /c/Projects/unix.workspace/trnma.unix # to unix //
#1629886438
cd /home/lmatheson4/my-home # to my-ho //
#1629886438
echo Lets build a kafkacat-based chat app # Jun21 middleware lab
#1629886438
cd /c/Projects/middleware.workspace/trnma.middleware-overview # to midd //
#1629886438
cd /c/Projects/middleware.workspace/kafka # to midd
#1629886438
sudo /opt/bb/bin/apt-get install kafkacat # Installing kafkacat in wsl
#1629886438
cd /c/Projects/explore/react # to react
#1629886438
npx create-react-app my-app # Create my-app
#1629886438
nvm install --lts # Install node.js
#1629886438
bb-inet-proxy-shell nvm install --lts # Install node.js
#1629886438
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash # install nvm to manage node versions
#1629886438
echo NVM init stuff is now in ~/.taskrc/nvm.taskrc #
#1629886438
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash # install nvm to manage node versions
#1629886438
cd /c/Projects/explore # to explore 0 //
#1629886438
cd /c/Projects/middleware.workspace/trnma.middleware-overview # to midd
#1629886438
cd /home/lmatheson4/my-home/zsh # to zsh
#1629886438
ssh -O check lmatheson@maczilla #
#1629886438
cd /c/Projects/training_repos_copier_workspace/trna.training_repos_copier # to repo
#1629886438
cd /c/Users/MathesonLes/AppData/Roaming/Code/User # to Code
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_publish # to pub //
#1629886438
loop python3.8 ./bannerguts.py # loop test bannerguts.py
#1629886438
black bannerguts.py #
#1629886438
pylintish bannerguts.py #
#1629886438
cd /c/Projects/guts.workspace/trnma.metrics/labs/bannerguts # to bann
#1629886438
cd /c/Projects/guts.workspace/trnma.metrics # to metr
#1629886438
ga settings.json.strip-and-sort.sh # Adopt the stableburner version
#1629886438
docker image ls | grep python # Find images
#1629886438
wget https://github.com/wagoodman/dive/releases/download/v0.10.0/dive_0.10.0_linux_amd64.deb # download dive
#1629886438
cd /c/Projects # to Proj 0
#1629886438
git reset --hard trnma/master # local-dev
#1629886438
git push -u jul12 __pmpublish_ref__:add_pmpublish # setup pm_publish for july 12 comdb2
#1629886438
cd /c/Projects/comdb2.workspace/trnma.comdb2 # to comdb
#1629886438
cd /c/Projects/trnma.bas # to bas //
#1629886438
cd /c/Projects/cpp.workspace # to cpp //
#1629886438
ff=index.md; git show trnma/master:./${ff} >${ff} # revert repo-copier effects (2)
#1629886438
ff=introduction.md; git show trnma/master:./${ff} >${ff} # revert repo-copier effects (2)
#1629886438
ff=objectives; git show trnma/master:./${ff} >${ff} # revert repo-copier effects (2)
#1629886438
ff=local-development-overview.md; git show trnma/master:./${ff} >${ff} # revert repo-copier effects (2)
#1629886438
ff=Makefile; git show trnma/master:./${ff} >${ff} # revert repo-copier effects (2)
#1629886438
git show trnma/master:./README.md >README.md # revert repo-copier effects
#1629886438
echo Resolving local-dev issues from july 12 delivery #
#1629886438
cd /c/Projects/docker.workspace/trnma.local-dev # to local //
#1629886438
cd /c/Users/MathesonLes/AppData/Roaming/Code/User # to Code //
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_reportserv # to repo
#1629886438
code ~/bin/localhist #1626777850
#1629886438
cd /c/Projects/unix/labs/bashdock # to unix 1
#1629886438
cd /home/lmatheson4/tmp/unix-jul12-autogist # to unix
#1629886438
cd /c/Projects/unix/labs/bashdock # to bash
#1629886438
cd /c/Projects/explore # to explore 0
#1629886438
cd /c/Projects/explore # to explor
#1629886438
cd /c/Projects/explore # to explore //
#1629886438
upload_bb_pypi # upload v0.7.1
#1629886438
ln -sf .config/bb-artifactory/bb-artifactory-upload.config ./ # configure bb artifactory upload
#1629886438
upload_bb_pypi #
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_sys # to pm_sys //
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_reportserv/pm_reportserv/pmsys_common # to sys
#1629886438
code pm_reportserv/version #
#1629886438
code --diff test_full_db-out.html new-report-db.html #
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_reportserv/test/test_full.d # to full
#1629886438
cd test/test_indivreport.d # to indiv
#1629886438
cd /c/Projects/progress-metrics.workspace/pm_reportserv/test/test_bigsheet.d # to shee
#1629886438
cd /c/Projects/progress-metrics.workspace/tmp/test.tmp # to test.tm
#1629886438
cd /home/lmatheson4/bin # to bin
#1629886438
echo $foo | tr 't' 'x' # foo
#1629886529
HISTFILE=/home/lmatheson4/.bash_history  # Switching from /c/Projects/revision-control.workspace/trnma.revision-control/bash_history
#1629895747
cd /c/Projects/revision-control.workspace/trnma.revision-control # to revis
#1629926418
cd /c/Projects/dmp.workspace/trnma.dmp # to dmp
#1629927030
cd /c/Projects/elt-classmgr.workspace # to class //
#1630062707
vim localhist # add comment
#1630063845
cd /c/Projects/localhist # to local
#1630063865
IFS=$'\n' words=( $(history 10) ) # parsing history into array of lines
#1630064521
select w in ${words[@]}; do echo "${w}"; done  # works!
#1630073646
source /c/Projects/localhist/bin/localhist; localhist_annotate # test1
#1630073712
lha_test() {source /c/Projects/localhist/bin/localhist; localhist_annotate; } # test1
#1630073716
lha_test() { source /c/Projects/localhist/bin/localhist; localhist_annotate; } # test1
#1630073809
builtin fc -ln -100 | command grep -v '#' | command tail -n 20 
#1630076403
lha_test #
#1630077064
gc -m "localhist_annotate() sort-of working"  # 
#1630077552
/c/Projects/localhist/publish/publish-via-github-release.sh  #
#1630090321
echo ${#hv[*]}
#1630090666
echo ${#hv[*]} #
#1630090916
lha_test() { source ~/projects/localhist/bin/localhist; localhist_annotate; } # test1
#1630091144
lha_test # www
#1631813044
vim bin/localhist
#1632161789
gs
#1632161791
gdf
#1632161796
exit
#1632161796
exit
#1632161796
exit
#1632392737
lr
#1632392741
cd bin
#1632392941
cd bin
#1632392942
./setup.sh 
#1632392994
exec bash
#1632392996
lh j
#1632393001
gs
#1632393007
ga bin
#1632393012
gdf --cached
