#1663406862
bash -ls
#1663431464
git clone gh:sanekits/shellkit
#1663431500
git tag 0.7.6
#1663431502
ls publish/publish-via-github-release.sh
#1663431505
publish/publish-via-github-release.sh
#1663431641
git merge update-shellkit
#1663431652
git fetch
#1663431660
git merge origin/update-shellkit
#1663431806
echo 0.8.1 > version
#1663431817
gpa Bump to 0.8.1
#1663431842
ln -sf ../../shellkit/realpath.sh
#1663431856
gpa Add realpath.sh
#1663431870
make build install-kit
#1663431925
./latest.sh --target /tmp/foo1 --noexec
#1663431979
rm tmp/*
#1663432000
tmp/latest.sh --target /tmp/foo --noexec
#1663432002
find /tmp/foo
#1663432009
tmp/latest.sh
#1663432080
code bin/ps1-foo-version.sh
#1663432109
bin/ps1-foo-version.sh
#1663432127
gpa Fix missing char
#1663432255
code --diff shellkit/templates/make-kit.mk.template make-kit.mk
#1663432350
gpa Update make-kit.mk publish target
#1663432361
make build install-kit publish
#1663437533
echo looper >> .gitignore
#1663437558
gco next-rev
#1663437561
gco -b next-rev
#1663437566
git push -u upstream next-rev
#1663438176
git push
#1663438721
git add -f shellkit/*
#1663438734
gpa Add missing bin/shellkit files
#1663495940
make git-pull
#1663495959
gco fix-github-download
#1663498890
echo https://github.com/sanekits/looper/releases/expanded_assets/0.2.0
#1663498896
curl https://github.com/sanekits/looper/releases/expanded_assets/0.2.0
#1663498929
curl https://github.com/sanekits/looper/releases/expanded_assets/0.2.0 | grep looper-setup-0.2.0
#1663502927
vim packages
#1663503035
bash -x ./shellkit-bootstrap.sh
#1663503978
code shellkit-bootstrap.sh
#1663503995
loop 'bash -x /home/lmatheson4/downloads/shellkit-bootstrap.sh '
#1663504036
shpm --version
#1663504058
shpm install taskrc-kit
#1663504080
cd /tmp/tmp.GCKYgtIhWI/
#1663504476
gco -b support-legacy-release-pages
#1663593252
npm start
#1663595386
npm start
#1663603725
histecho.sh --config
#1663603785
code ~/.histecho
#1663603947
histecho.sh --help
#1663603955
histecho.sh --makeconfig
#1663603962
histecho.sh .config
#1663603998
man date
#1663604055
date -I seconds
#1663604059
date -Iseconds
#1663604378
gpa histecho.sh works
#1663605482
cat ~/.bash_history
#1663605524
cat ~/.bash_history  | grep -OE '^\#[0-9]+'
#1663605531
cat ~/.bash_history  | grep -E '^\#[0-9]+'
#1663605536
cat ~/.bash_history  | grep -E '^\#[0-9]+$'
#1663605541
cat ~/.bash_history  | grep -Ev '^\#[0-9]+$'
#1663605695
loop 'sourceMe=1 source /home/lmatheson4/bin/histecho.sh ; do_send'
#1663605737
loop 'sourceMe=1 source /home/lmatheson4/bin/histecho.sh ; do_send'
#1663605755
loop 'sourceMe=1 source /home/lmatheson4/bin/histecho.sh ; source ~/.histecho; do_send'
#1663608154
history -a "Hello"
#1663608176
history --help
#1663608214
hist -s "So now " we have a "$PATH" entry
#1663608226
So now  we have a /home/lmatheson4/.taskrc/bin:/bin:/opt/bb/bin:/home/lmatheson4/.nvm/versions/node/v16.15.1/bin:/usr/local/npm-prefix/bin:/home/lmatheson4/.vscode-server/bin/74b1f979648cc44d385a2286793c226e611f59e7/bin/remote-cli:/home/lmatheson4/.local/bin:/home/lmatheson4/bin:/home/lmatheson4/.taskrc/bin:/bin:/opt/bb/bin:/home/lmatheson4/.nvm/versions/node/v16.15.1/bin:/usr/local/npm-prefix/bin:/home/lmatheson4/bin/bbonly:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Users/lmatheson4/.taskrc/bin:/mnt/c/Users/lmatheson4/.local/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Users/lmatheson4/bin:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0:/mnt/c/WINDOWS/System32/OpenSSH:/mnt/c/ProgramData/chocolatey/bin:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/nodejs:/mnt/c/Program Files/GitHub CLI:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/Users/lmatheson4/AppData/Local/Programs/Python/Python310/Scripts:/mnt/c/Users/lmatheson4/AppData/Local/Programs/Python/Python310:/mnt/c/Users/lmatheson4/AppData/Local/Microsoft/WindowsApps:/mnt/c/blp/DAPI:/mnt/c/blp/DAPI/DDE:/mnt/c/Users/lmatheson4/AppData/Roaming/npm:/mnt/c/Users/lmatheson4/AppData/Roaming/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/snap/bin:/home/lmatheson4/win-profile/AppData/Roaming/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/home/lmatheson4/win-profile/AppData/Roaming/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin
#1663608226
/mnt/c/Users/lmatheson4/AppData/Roaming/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/c/Windows/System32 entry
#1663608262
# If you use 'hist -s' you can append any content to the history file
#1663608276
histecho.sh  --loop
#1663608564
loop histecho.sh
#1663608675
rm Hello
#1663608686
gpa "Add timestamp transform to histecho.sh"
#1663608758
ls /etc/resolv.conf
#1663608763
ls -al resolv.conf
#1663608907
while true; do histecho.sh; sleep 5; done
#1663609059
# this is a new record
#1663609063
histecho.sh
#1664192026
make | grep all_targets
#1664209555
gco main
#1664209563
git reset --hard 1.0.0
#1664209572
git push -fu origin master
#1664220119
docker image ls | grep router
#1664220137
docker pull artifactory.inf.bloomberg.com/bas-router
#1664220189
docker run --rm artprod.dev.bloomberg.com/bas-router
#1664225808
git-make-child-clone.sh
#1664226004
gco origin/master
#1664226012
cat localhist
#1664226020
cat localhist | xclip
#1664241231
cat .localhistrc
#1664241320
rm ~/.local/bin/localhist/localhist
#1664241324
( set -x; source ~/.bashrc; )
#1664323367
mv .bash_history-bak1 .bash_history
#1664323404
docker image ls | grep dpkg
#1664323415
docker image ls | grep test
#1664323425
docker image ls | grep shell
#1664323468
docker run --rm shellkit-test-base:latest bash
#1664323474
docker run --rm -it shellkit-test-base:latest bash
#1664323500
docker run -v /etc/passwd:/etc/passwd:ro --rm -it shellkit-test-base:latest bash
#1664323547
ls /etc/group
#1664323551
cat /etc/group
#1664323572
docker run -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro --rm -it shellkit-test-base:latest bash
#1664323609
docker run -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro --rm -it shellkit-test-base:latest bash # Mounting etc in the container
#1664323641
ls /etc/sudoers
#1664323643
cat /etc/sudoers
#1664323666
docker run -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro /etc/sudoers:/etc/sudoers --rm -it shellkit-test-base:latest bash # Mounting etc in the container
#1664323680
docker run -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro  --rm -it shellkit-test-base:latest bash # Mounting etc in the container
#1664324003
type -a sudo
#1664324032
docker run -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro  -v /bin/sudo:/bin/sudo:ro --rm -it shellkit-test-base:latest bash # Mounting etc in the container
#1664325732
type -a make
#1664325764
docker run -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro  -v /bin/make:/bin/make:ro --rm -it shellkit-test-base:latest bash # Mounting etc in the container
#1664325930
rm prompt-command-wrap.bashrc
#1664325937
grep prompt-com *
#1664325942
vim bashrc-common
#1664326012
set_bashdebug_mode
#1664326017
set_bashdebug_mode  --on
#1664326125
( set_bashdebug_mode --on; source ~/.bashrc )
#1664326144
( set_bashdebug_mode --on; source ~/.bashrc ) | vim -
#1664326155
( set_bashdebug_mode --on; source ~/.bashrc ) 2>&1 | view -
#1664326178
set_bashdebug_mode --off
#1664326183
set | wc -l
#1664326190
set | view -
#1664326424
type -a shpm
#1664326453
where shpm
#1664326456
which shpm
#1664326489
realpath.sh -f shpm
#1664326494
realpath.sh shpm
#1664326513
rm bin/realpath.sh
#1664326519
( bash -x shpm install shellkit-pm )
#1664326537
bash -x realpath.sh
#1664326562
type -a realpath.sh
#1664326628
cd .local/bin/shellkit-pm/
#1664326632
code shpm
#1664326649
which realpath.sh
#1664326654
code ../realpath.sh
#1664326697
bash -x shpm install shellkit-pm
#1664326823
cd /tmp/tmp.OFIzjnzXkE/
#1664326836
cat rawpage.html
#1664326840
code rawpage.html
#1664326900
cd ~/.config/shellkit-meta/
#1664326909
code packages*
#1664326985
cd /tmp/tmp.044AsmWJS2/
#1664327000
./shellkit-pm-setup-latest.sh
#1664327134
./install-package.sh shellkit-pm
#1664327447
cd /tmp/tmp.AZYzbvmLdU/
#1664327450
code expanded-assets.html
#1664327724
./shpm install shellkit-pm
#1664327764
./shpm install shellkit-pm
#1664327782
echo 0.5.5 > version
#1664327911
cd ~/.local/bin/shellkit-pm/
#1664328128
./shellkit-bootstrap.sh
#1664328153
scp shellkit-bootstrap.sh gnrld-pw-705:tmp/
#1664358793
shpm list
#1664359048
./dev-launch.sh 0
#1664359221
dev --quit
#1664359318
./dev-launch.sh --quit
#1664359393
gpa "Add kdestroy during --quit"
#1664359584
gpa "Don't write packages.proposed unless changed"
#1664359598
echo 0.5.6 > version
#1664359602
make apply-version build
#1664359624
gpa Bump version
#1664359631
make publish
#1664359728
shpm install shellkit-pm
#1664359775
lsg environ
#1664359792
git ls-files
#1664359813
gpa Add prompt-command-wrap to workspace urls
#1664361239
gco master
#1664361251
gb -d integrate-shellkit
#1664361300
cd /home/lmatheson4/projects/shellkit.workspace/localhist
#1664361334
code lh_archive.mk
#1664361407
gco -b archive-gen2
#1664361420
git push -u origin archive-gen2
#1664361437
cat version
#1664361445
echo 2.1.0 > version
#1664361449
make apply-version
#1664361463
gpa Bump to 2.1.0
#1664361933
./localhist-archive.sh --login
#1664361952
./localhist-archive.sh
#1664362057
cd /home/lmatheson4/projects/shellkit.workspace/localhist/bin
#1664362124
loop /home/lmatheson4/projects/shellkit.workspace/localhist/bin/localhist-archive.sh
#1664362167
cd ~/.localhist-archive/
#1664362261
make devcontainer-vscode-user
#1664362585
make devcontainer-exec
#1664362809
cd .local/bin/localhist/
#1664362835
cd shellkit.workspace/localhist/
#1664362887
make build
#1664362891
make install-kit
#1664362927
bash --norc
#1664362947
bash --rcfile <(echo '#')
#1664362962
bash --rcfile <(echo 'echo hello')
#1664363242
cd shellkit.workspace/
#1664363247
code Makefile
#1664363292
code .devcontainer/Dockerfile
#1664374756
pyenv shell 3.9.5
#1664374885
docker image ls | grep localhist
#1664374894
docker image ls | grep shellkit
#1664374905
docker tag
#1664374950
docker tag shellkit-test-withtools:latest localhist-image-base:latest
#1664375009
devcontainer open
#1664375070
env | grep prox
#1664375871
vim bin/devcontainer-build-init.sh
#1664386958
cat /etc/docker/daemon.json
#1664386967
cat /etc/docker/daemon.json | xclip
#1664388876
git remote rename origin
#1664388883
git remote rename origin trnma
#1664388896
ls | grep bas
#1664388901
mkdir bas.workspace
#1664388910
mv bas bas.workspace/trnma.bas
#1664388912
cd  bas.workspace/trnma.bas
#1664389075
git remote add sep19 bbgithub:$sep19/bas
#1664389079
git fetch sep19
#1664389086
git reset --hard sep19/main
#1664389100
git fetch trnma
#1664389116
git merge -X ours trnma/main
#1664389161
git push -u sep19 main
#1664389283
gco -b lmatheson4-prep
#1664389299
cd labs/currencies-schema/
#1664389615
make .flag/build
#1664389754
ga taskrc taskrc.mk
#1664389764
gc -m "Add taskrc*"
#1664389781
rm -rf .etc .flag .gitignore Dockerfile currsvc.xsd docker-compose.yaml
#1664389896
rm -rf bas-currencies/
#1664389922
echo .flag >> .gitignore
#1664390061
git push -u sep19 lmatheson4-prep
#1664390321
dc config
#1664390438
make .flag/schema-valid
#1664390442
make .flag/schema-valid
#1664390490
rm .flag/build
#1664390568
cd /home/lmatheson4/projects/bas.workspace/trnma.bas/labs/currencies-schema/me # cdmark
#1664390583
# Prep to teach bas schema for sep19
#1664390592
tmk .flag/schema-valid
#1664390599
ls .flag
#1664396299
docker images ls | grep python-devel
#1664396303
docker image ls | grep python-devel
#1664396330
docker image ls | grep python-devel | grep months
#1664396340
docker image ls | grep python-devel | grep months | grep 3.10
#1664396355
docker image rm b75e1bb0dcb6
#1664396393
docker pull artifactory.inf.bloomberg.com/dpkg-python-development-base:3.10
#1664396419
cat Dockerfile
#1664396447
dc down --remove-orphans
#1664396481
docker pull artprod.inf.bloomberg.com/dpkg-python-development-base:3.10
#1664396506
docker rm artprod.inf.bloomberg.com/dpkg-python-development-base:3.10
#1664396517
docker image rm artprod.inf.bloomberg.com/dpkg-python-development-base:3.10
#1664396521
docker image rm artprod.inf.bloomberg.com/dpkg-python-development-base
#1664396533
docker image ls | grep artprod.inf.bloomberg.com/dpkg-python-development-base
#1664396542
docker image ls | grep 'artprod.inf.bloomberg.com/dpkg-python-development-base'
#1664396548
docker image ls | grep 'artprod'
#1664396561
docker image ls | grep 'artprod.*python'
#1664396587
docker image pull artprod.dev.bloomberg.com/dpkg-python-development-base:3.10
#1664396614
docker image rm artprod.dev.bloomberg.com/dpkg-python-development-base:3.10
#1664396622
dc build --pull
#1664396635
dc run --rm schema bash
#1664399243
less currsvc.xsd
#1664399669
tmk validate-schema
#1664399728
gpa Add currency request / response
#1664400032
code -r .
#1664400059
code README.md
#1664400102
dc build
#1664400581
mkdir me
#1664400598
code taskrc.mk
#1664400756
tmk build
#1664400812
ls .flag/download
#1664400859
make clean
#1664400861
tmk clean
#1664400913
rm .flag/download
#1664400948
ga taskrc*
#1664400965
rm -rf .etc client service docker-compose.yaml
#1664400971
rm -rf bas-spot-rates/
#1664400975
tmk download
#1664400980
ls bas-spot-rates/
#1664401024
tmk .flag/build
#1664404523
cd labs/spot-rates/me/
#1664404545
ls .flag/
#1664404554
echo '*' > .flag/.gitignore
#1664407143
docker stop recursing_cohen
#1664407148
docker stop devcontainer_shellkit-dev_1
#1664407153
docker container ls
#1664407155
docker container ls --all
#1664407163
docker volume ls
#1664407875
grep python3 *
#1664407882
cat python.taskrc
#1664407899
task-find.sh python3
#1664408559
chmod +x python3-select.sh
#1664408570
./python3-select.sh
#1664408858
./python3-select.sh  --version
#1664408874
(set -x ; sourceMe=1 ./python3-select.sh )
#1664408885
(set -x ; sourceMe=1 . ./python3-select.sh )
#1664408894
(set -x ; sourceMe=1 source ./python3-select.sh )
#1664408909
(set -x ; sourceMe=1 source ./python3-select.sh ; python3_select )
#1664408915
(sourceMe=1 source ./python3-select.sh ; python3_select )
#1664408921
which python3.9
#1664409027
type -a python3
#1664409035
echo $BEST_PY3
#1664409058
python3_select
#1664409069
set -x; python3_select; set +x
#1664409130
set -x; python3; set +x
#1664409185
gpa Factor python3-select.sh from bashrc-common
#1664409188
git pull
#1664148258
gs
#1664148260
gdf
#1664191987
clear
#1664191988
lr
#1664191992
ls
#1664192009
.1
#1664192009
ls
#1664192012
make
#1664192026
make | grep all_targets
#1664192058
make devcontainer-exec
#1664208566
lr
#1664208723
cd localhist/
#1664208723
lr
#1664208725
code .
#1664209493
tig
#1664209529
gs
#1664209530
gdf
#1664209532
gpa
#1664209534
tig
#1664209555
gco main
#1664209559
gco master
#1664209563
git reset --hard 1.0.0
#1664209564
tig
#1664209572
git push -fu origin master 
#1664220119
docker image ls | grep router
#1664220137
docker pull artifactory.inf.bloomberg.com/bas-router
#1664220189
docker run --rm artprod.dev.bloomberg.com/bas-router 
#1664220523
clear
#1664225803
gs
#1664225808
git-make-child-clone.sh 
#1664225981
cd /tmp/localhist
#1664225984
gco master
#1664225986
tig
#1664225991
gs
#1664226004
gco origin/master
#1664226006
lr
#1664226008
cd bin
#1664226009
ls
#1664226012
cat localhist
#1664226020
cat localhist | xclip
#1664241226
cd
#1664241231
cat .localhistrc
#1664241273
( set -x; source ~/.bashrc; )
#1664241320
rm ~/.local/bin/localhist/localhist
#1664241324
( set -x; source ~/.bashrc; )
#1664241388
bash -l
#1664405990
exit
#1664405993
exit
#1664242090
bash -l
#1664405995
exit
#1664405978
tw
#1664406010
cd localhist
#1664406018
gs
#1664406020
gdf
#1664406023
code .
#1664407015
gs
#1664407018
docksh
#1664407143
docker stop recursing_cohen
#1664407148
docker stop devcontainer_shellkit-dev_1 
#1664407153
docker container ls
#1664407155
docker container ls --all
#1664407163
docker volume ls
#1664407226
code .
#1664407862
type -a python3
#1664407872
cd ~/.taskrc
#1664407875
grep python3 *
#1664407882
cat python.taskrc
#1664407899
task-find.sh python3
#1664407930
cd ~/bin
#1664408206
cd bin
#1664408549
lr
#1664408552
gs
#1664408559
chmod +x python3-select.sh 
#1664408570
./python3-select.sh 
#1664408858
./python3-select.sh  --version
#1664408874
(set -x ; sourceMe=1 ./python3-select.sh )
#1664408885
(set -x ; sourceMe=1 . ./python3-select.sh )
#1664408894
(set -x ; sourceMe=1 source ./python3-select.sh )
#1664408909
(set -x ; sourceMe=1 source ./python3-select.sh ; python3_select )
#1664408915
(sourceMe=1 source ./python3-select.sh ; python3_select )
#1664408921
which python3.9
#1664409024
exec bash
#1664409027
type -a python3
#1664409035
echo $BEST_PY3
#1664409042
python3
#1664409058
python3_select
#1664409069
set -x; python3_select; set +x
#1664409118
exec bash
#1664409130
set -x; python3; set +x
#1664409148
gs
#1664409151
ga .
#1664409151
gs
#1664409185
gpa Factor python3-select.sh from bashrc-common
#1664409188
git pull
#1664409240
gs
#1664409248
ga .
#1664409249
gs
#1664409253
gc
#1664409256
gpa
#1664409258
lr
