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
#1632481068
# TODO: add a TODO index, perhaps saving these in ~/journal?
#1632483711
# TODO: also a TIL index.  This is a generic "lets' index this particular comment for some purpose
#1632851030
# Let's create localhist-archive.sh and lh_archive.mk to archive bash_history content for github-storage and fast search, etc.
#1632913691
# We're making progress, in ~/tmp/.localhist.  need to filter-out 'root'
#1632913720
ln -sf /c/Projects/zap_container/bash_history ./^c^Projects^zap_container^bash_history #
#1632918157
make -f /c/Projects/localhist/bin/lh_archive.mk #
#1632918157
make -f /c/Projects/localhist/bin/lh_archive.mk #
#1632934512
h
#1632934512
h
#1632934569
lh grep \#
#1632934575
hg \#
#1632934606
h
#1632934610
exit
#1632934772
clear
#1632934784
cd ../publish/
#1632934784
lr
#1632934790
./publish-via-github-release.sh 
#1632934793
.1
#1632934793
gs
#1632934811
gdf
#1632934830
cd bin
#1632934832
./setup.sh 
#1632934836
exec bash
#1632934841
echo $LH_ARCHIVE
#1632934851
echo $HOST
#1632934860
echo $HOSTNAME
#1632941697
exec bash
#1632941723
echo $LH_ARCHIVE
#1632941733
unset  LH_ARCHIVE
#1632941743
lh arc
#1632941749
lh arch
#1632941802
./setup.sh 
#1632941811
exec bash
#1632941816
unset  LH_ARCHIVE #
#1632941819
lh arch
#1632941905
./setup.sh 
#1632941909
unset  LH_ARCHIVE #
#1632941912
lh arch
#1632942015
./setup.sh 
#1632942017
unset  LH_ARCHIVE #
#1632942020
lh arch
#1632942174
./setup.sh 
#1632942203
./setup.sh; unset  LH_ARCHIVE ; lh arch; #
#1632942253
exec bash
#1632942259
./setup.sh; lh arch; #
#1632942268
echo $LH_ARCHIVE 
#1632942335
./setup.sh; exec bash; lh arch; #
#1632942342
exec bash
#1632942345
lh arch #
#1632942367
echo $HOSTNAME
#1632942408
./setup.sh; lh arch; #
#1632942493
cd ~/journal/lh_archive/pf140XGZ/
#1632942494
lr
#1632942508
gs
#1632942534
cd /c/Projects/localhist/bin
#1632942576
cd /home/lmatheson4/journal/lh_archive/pf140XGZ
#1632942577
lr
#1632942579
gs
#1632942580
.1
#1632942581
gs
#1632942590
rm *
#1632946670
cdb2sql --help
#1632996114
clear
#1632996218
h
#1632996244
cd /home/lmatheson4/journal/lh_archive/pf140XGZ #
#1632996273
e
#1632996276
h
#1632996298
hc
#1632996372
exec bash
#1632996373
hg
#1632996395
exec bash
#1632996397
hg
#1632996407
history_grep '#'
#1632996423
exec bash
exec bash
exec bash
#1632996475
exec bash
#1632996477
hg
#1632996480
type -a hg
#1632996489
hc
#1632996493
type -a hc
#1632996512
type -a history_grep
#1632996551
exec bash
#1632996552
hc
#1632996793
exec bash
#1632996794
hc
#1632996821
# TODO: stop cdpp from logging all cd changes with hash
#1632996851
# TODO: lh annotate should loop until user exit
#1632996909
lh e
#1632997029
cd localhi
#1632997033
cd localhi //
#1632997036
h
#1632997043
cd localhist/
#1632997045
lr
#1632997050
cd bin
#1632997055
source localhist
#1632997059
lh a
#1632997070
type -a localhist_annotate
#1632997073
type -a lha
#1632997084
lh
#1632997102
type -a localhist_annotate_inner 
#1632997105
lh a
#1632997131
source ./localhist
#1632997133
lh a
#1632997145
source ./localhist
#1632997147
lh a
#1632997160
type -a lh
#1632997168
localhist annotate
#1632997201
source ./localhist
#1632997205
lh a
#1632997209
exit
#1632997209
exit
#1632997220
lh a
#1632997235
source localhist
#1632997238
cd bin
#1632997242
source ./localhist
#1632997243
lh a
#1632997274
source ./localhist
#1632997276
lh a
#1632997311
source ./localhist
#1632997322
set +x
#1632997323
lh a
#1632997343
source ./localhist; lh a
#1632997474
source ./localhist #
#1632997493
type -a localhist_annotate_inner #
#1632997497
gs
#1632997502
lh arch
#1632997528
cd lh_arch
#1632997535
cd journal/lh_archive/
#1632997535
lr
#1632997538
cd pf140XGZ/
#1632997539
gs
#1632997541
ga .
#1632997542
gs
#1632997546
gpa
#1632997565
lh arch
#1632997567
gs
#1632997842
cd /c/Projects/localhist/bin
#1632997851
./localhist-grep.sh -a foo
#1632997859
./localhist-grep.sh --archive foo
#1632997863
./localhist-grep.sh foo
#1632997885
./localhist-grep.sh --archive foo
#1632998113
cat > localhist-dump.sh
#1632998308
lr
#1632998359
chmod +x localhist-dump.sh 
#1632998362
./localhist-dump.sh 
#1632998462
loop ./localhist-dump.sh 
#1632998602
loop ./localhist-dump.sh  -c
#1632998613
loop ./localhist-dump.sh  --commented
#1632999022
source ./localhist
#1632999024
lh d
#1632999031
./setup.sh 
#1632999035
lh d
#1632999044
lh d -c
#1632999084
source ./localhist; lh d -c
#1632999170
source ./localhist
#1632999174
type -a lh
#1632999179
lh d -c
#1632999247
source ./localhist
#1632999250
lh d -c
#1632999302
set +x
#1632999304
lh d -c
#1632999315
source ./localhist
#1632999318
set +x
#1632999321
lh d -c
#1632999325
lh d 
#1632999330
lh d -c
#1632999476
source ./localhist
#1632999480
lh d -c
#1632999482
gs
#1632999484
ga .
#1632999484
gs
