cd -
#1663431444
cd ./publish/
#1663431445
ls -al
#1663431451
.1
#1663431453
gs
#1663431464
git clone gh:sanekits/shellkit
#1663431466
gs
#1663431472
cd ./publish/
#1663431473
ls
#1663431474
ls -al
#1663431475
.1
#1663431487
ls publish/publish-via-github-release.sh 
#1663431500
git tag 0.7.6
#1663431502
ls publish/publish-via-github-release.sh 
#1663431505
publish/publish-via-github-release.sh 
#1663431632
gs
#1663431641
git merge update-shellkit
#1663431645
gba
#1663431652
git fetch
#1663431660
git merge origin/update-shellkit 
#1663431774
gs
#1663431778
ga .
#1663431779
gc
#1663431783
git push
#1663431787
make apply-version 
#1663431788
gs
#1663431801
cat version 
#1663431806
echo 0.8.1 > version 
#1663431811
make apply-version 
#1663431812
gs
#1663431817
gpa Bump to 0.8.1
#1663431819
gs
#1663431823
make build install-kit 
#1663431832
cd bin/shellkit/
#1663431833
ls
#1663431842
ln -sf ../../shellkit/realpath.sh 
#1663431843
gs
#1663431846
lr
#1663431851
ga -f .
#1663431851
gs
#1663431856
gpa Add realpath.sh
#1663431858
gs
#1663431859
lr
#1663431860
.1
#1663431861
gs
#1663431863
.1
#1663431863
gs
#1663431864
lr
#1663431866
gs
#1663431870
make build install-kit 
#1663431897
lr
#1663431905
cd tmp
#1663431906
ls
#1663431909
lr
#1663431925
./latest.sh --target /tmp/foo1 --noexec
#1663431931
cd /tmp/foo1/
#1663431931
ls
#1663431936
find
#1663431952
cd -
#1663431952
ls
#1663431954
.1
#1663431955
ls
#1663431960
cd bin
#1663431960
ls
#1663431963
ls -al
#1663431967
cd shellkit
#1663431968
ls 
#1663431970
ls -al
#1663431976
.2
#1663431979
rm tmp/*
#1663431980
make build
#1663432000
tmp/latest.sh --target /tmp/foo --noexec
#1663432002
find /tmp/foo
#1663432009
tmp/latest.sh 
#1663432016
exec bash
#1663432018
exit
#1663437508
gs
#1663437509
.1
#1663437512
make gs
#1663437517
ls
#1663437533
echo looper >> .gitignore
#1663437534
gs
#1663437536
ga .
#1663437537
gap
#1663437538
gpa
#1663437540
gs
#1663437542
make gs
#1663437549
cd bb-shellkit/
#1663437552
gba
#1663437553
gs
#1663437558
gco next-rev
#1663437561
gco -b next-rev
#1663437561
gs
#1663437562
gpa
#1663437566
git push -u upstream next-rev 
#1663438174
gs
#1663438176
git push 
#1663438179
gba
#1663438183
grv
#1663438193
ls
#1663438204
cd ../shellkit-pm/
#1663438205
gs
#1663438206
grv
#1663438206
tig
#1663438214
gba
#1663438702
ls
#1663438705
cd shellk
#1663438709
ls
#1663438713
cd bin
#1663438713
ls
#1663438721
git add -f shellkit/*
#1663438721
gs
#1663438734
gpa Add missing bin/shellkit files
#1663405374
dev 0
#1663495930
.2
#1663495936
make gs
#1663495940
make git-pull
#1663495952
cd shellkit-pm/
#1663495954
gs
#1663495956
gba
#1663495959
gco fix-github-download 
#1663432023
ls
#1663432041
clear
#1663432041
ls
#1663432043
false
#1663432047
true
#1663432061
make publish
#1663432070
bin/ps1-foo-version.sh 
#1663432080
code bin/ps1-foo-version.sh 
#1663432109
bin/ps1-foo-version.sh 
#1663432123
gs
#1663432127
gpa Fix missing char
#1663432132
make build
#1663432135
make publish
#1663432148
gs
#1663432150
git push
#1663432156
ls
#1663432172
make publish
#1663432192
ls
#1663432198
code Makefile 
#1663432255
code --diff shellkit/templates/make-kit.mk.template make-kit.mk 
#1663432341
gs
#1663432350
gpa Update make-kit.mk publish target
#1663432361
make build install-kit publish
#1663496016
code -r .
#1663406862
bash -ls
#1663406865
bash -l
#1663498890
echo https://github.com/sanekits/looper/releases/expanded_assets/0.2.0
#1663498896
curl https://github.com/sanekits/looper/releases/expanded_assets/0.2.0
#1663498929
curl https://github.com/sanekits/looper/releases/expanded_assets/0.2.0 | grep looper-setup-0.2.0
#1663498951
exit
#1663501548
clear
#1663501549
lr
#1663501554
gs
#1663501674
lr
#1663502543
clear
#1663502544
cd
#1663502548
exec bash
#1663502833
cd shellk
#1663502846
cd shellkit-pm/
#1663502847
toa
#1663502848
lr
#1663502848
gs
#1663502850
cd bin
#1663502851
lr
#1663502860
./shellkit-bootstrap.sh 
#1663502881
.1
#1663502885
make publish
#1663502924
cd ../shellkit-meta/
#1663502924
lr
#1663502927
vim packages 
#1663502946
cd pm
#1663502947
gs
#1663502951
make publish
#1663503005
cd ~/downloads/
#1663503005
lr
#1663503008
./shellkit-bootstrap.sh 
#1663503035
bash -x ./shellkit-bootstrap.sh 
#1663503553
lr
#1663503742
./shellkit-bootstrap.sh 
#1663503747
exec bash
#1663503975
lr
#1663503978
code shellkit-bootstrap.sh 
#1663503995
loop 'bash -x /home/lmatheson4/downloads/shellkit-bootstrap.sh '
#1663504033
cd
#1663504036
shpm --version
#1663504042
shpm install shellkit-pm
#1663504054
shpm list
#1663504058
shpm install taskrc-kit
#1663504080
cd /tmp/tmp.GCKYgtIhWI/
#1663504081
ls
#1663504085
code rawpage.html 
#1663504476
gco -b support-legacy-release-pages
#1663504479
exit
#1663591942
gurl
#1663593252
npm start
#1663595386
npm start
#1663590938
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
#1663603991
date -I
#1663603993
date
#1663603998
man date
#1663604051
date -Iseconds
#1663604055
date -I seconds
#1663604059
date -Iseconds
#1663604097
histecho.sh 
#1663604175
histecho.sh  --loop
#1663604368
gs
#1663604369
cd bin
#1663604370
gs
#1663604371
gdf
#1663604378
gpa histecho.sh works
#1663605117
gs
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
#1663608157
h
#1663608176
history --help
#1663608214
hist -s "So now " we have a "$PATH" entry
#1663608226
So now  we have a /home/lmatheson4/.taskrc/bin:/bin:/opt/bb/bin:/home/lmatheson4/.nvm/versions/node/v16.15.1/bin:/usr/local/npm-prefix/bin:/home/lmatheson4/.vscode-server/bin/74b1f979648cc44d385a2286793c226e611f59e7/bin/remote-cli:/home/lmatheson4/.local/bin:/home/lmatheson4/bin:/home/lmatheson4/.taskrc/bin:/bin:/opt/bb/bin:/home/lmatheson4/.nvm/versions/node/v16.15.1/bin:/usr/local/npm-prefix/bin:/home/lmatheson4/bin/bbonly:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Users/lmatheson4/.taskrc/bin:/mnt/c/Users/lmatheson4/.local/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Users/lmatheson4/bin:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0:/mnt/c/WINDOWS/System32/OpenSSH:/mnt/c/ProgramData/chocolatey/bin:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/nodejs:/mnt/c/Program Files/GitHub CLI:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/Users/lmatheson4/AppData/Local/Programs/Python/Python310/Scripts:/mnt/c/Users/lmatheson4/AppData/Local/Programs/Python/Python310:/mnt/c/Users/lmatheson4/AppData/Local/Microsoft/WindowsApps:/mnt/c/blp/DAPI:/mnt/c/blp/DAPI/DDE:/mnt/c/Users/lmatheson4/AppData/Roaming/npm:/mnt/c/Users/lmatheson4/AppData/Roaming/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/snap/bin:/home/lmatheson4/win-profile/AppData/Roaming/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/home/lmatheson4/win-profile/AppData/Roaming/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin
/mnt/c/Users/lmatheson4/AppData/Roaming/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:/c/Windows/System32 entry
#1663608227
h
#1663608262
# If you use 'hist -s' you can append any content to the history file
#1663608269
histecho.sh 
#1663608276
histecho.sh  --loop
#1663608564
loop histecho.sh 
#1663608672
gs
#1663608675
rm Hello 
#1663608676
gs
#1663608686
gpa "Add timestamp transform to histecho.sh"
#1663608758
ls /etc/resolv.conf
#1663608761
cd /etc
#1663608763
ls -al resolv.conf
#1663608893
histecho.sh 
#1663608907
while true; do histecho.sh; sleep 5; done
#1663609030
histecho.sh 
#1663609051
ls
#1663609059
# this is a new record
#1663609063
histecho.sh 
#1663609179
h -w
#1664323367
mv .bash_history-bak1 .bash_history
#1664323367
mv .bash_history-bak1 .bash_history
#1664323370
h
#1664323373
lh
#1664323391
cd
#1664323392
cd tmp
#1664323393
ls
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
#1664323615
h
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
#1664324160
clear
#1664324161
ls
#1664325722
lr
#1664325732
type -a make
#1664325736
h
#1664325764
docker run -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro  -v /bin/make:/bin/make:ro --rm -it shellkit-test-base:latest bash # Mounting etc in the container
#1664325809
clear
#1664325809
ls
#1664325922
cd bin
#1664325922
ls
#1664325927
lr
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
#1664326170
set 
#1664326178
set_bashdebug_mode --off
#1664326181
set
#1664326183
set | wc -l
#1664326190
set | view -
#1664326318
clear
#1664326397
shpm install shellkit-pm
#1664326415
( bash -x shpm install shellkit-pm )
#1664326424
type -a shpm
#1664326453
where shpm
#1664326456
which shpm
#1664326460
cd
#1664326470
( bash -x shpm install shellkit-pm )
#1664326489
realpath.sh -f shpm
#1664326494
realpath.sh shpm
#1664326503
type -a realpath.sh
#1664326513
rm bin/realpath.sh 
#1664326519
( bash -x shpm install shellkit-pm )
#1664326537
bash -x realpath.sh
#1664326562
type -a realpath.sh
#1664326584
code .
#1664326604
ls
#1664326628
cd .local/bin/shellkit-pm/
#1664326629
ls 
#1664326632
code shpm
#1664326649
which realpath.sh
#1664326654
code ../realpath.sh 
#1664326665
ls
#1664326697
bash -x shpm install shellkit-pm
#1664326823
cd /tmp/tmp.OFIzjnzXkE/
#1664326825
ls
#1664326836
cat rawpage.html 
#1664326840
code rawpage.html 
#1664326900
cd ~/.config/shellkit-meta/
#1664326901
ls
#1664326909
code packages*
#1664326950
lr
#1664326970
shpm install shellkit-pm
#1664326985
cd /tmp/tmp.044AsmWJS2/
#1664326986
code .
#1664327000
./shellkit-pm-setup-latest.sh 
#1664327043
cd shellkit
#1664327050
code -r .
#1664327091
ls
#1664327095
cd bin
#1664327099
./shpm install shellkit-pm
#1664327134
./install-package.sh shellkit-pm
#1664327447
cd /tmp/tmp.AZYzbvmLdU/
#1664327447
lr
#1664327450
code expanded-assets.html 
#1664327718
lr
#1664327724
./shpm install shellkit-pm
#1664327752
gs
#1664327764
./shpm install shellkit-pm
#1664327774
.1
#1664327775
cat version 
#1664327782
echo 0.5.5 > version
#1664327788
make apply-version 
#1664327789
gs
#1664327793
gdf
#1664327854
gs
#1664327858
make publish
#1664327903
make install-kit 
#1664327911
cd ~/.local/bin/shellkit-pm/
#1664327912
ls
#1664327928
scp shellkit-bootstrap.sh gnrld-pw-705:tmp/
#1664328076
lr
#1664328083
./shellkit-bootstrap.sh 
#1664328107
make build
#1664328111
cd -
#1664328122
lr
#1664328124
cd bin
#1664328128
./shellkit-bootstrap.sh 
#1664328140
gs
#1664328153
scp shellkit-bootstrap.sh gnrld-pw-705:tmp/
#1664358449
exit
#1664358771
cd bb-dev
#1664358775
code -r .
#1664358785
lr
#1664358790
cat version
#1664358793
shpm list
#1664358914
lr
#1664358915
cd bin
#1664358916
lr
#1664358920
./dev-launch.sh --quit
#1664359048
./dev-launch.sh 0
#1664359195
gs
#1664359197
.1
#1664359198
gs
#1664359200
make apply-version 
#1664359203
make build
#1664359207
make install-kit 
#1664359215
dev 0
#1664359221
dev --quit
#1664359312
cd bin
#1664359318
./dev-launch.sh --quit
#1664359372
gs
#1664359375
.1
#1664359379
gs
#1664359393
gpa "Add kdestroy during --quit"
#1664359408
make publish
#1664359531
cd ..
#1664359536
make gs
#1664359546
cd shellkit-pm/
#1664359547
gs
#1664359548
gdf
#1664359584
gpa "Don't write packages.proposed unless changed"
#1664359592
cat version
#1664359598
echo 0.5.6 > version
#1664359602
make apply-version build
#1664359606
make install-kit 
#1664359616
make publish
#1664359618
gs
#1664359624
gpa Bump version
#1664359631
make publish
#1664359728
shpm install shellkit-pm
#1664359737
.1
#1664359739
make gs
#1664359743
cd bb-shellkit/
#1664359744
gs
#1664359745
gdf
#1664359769
cd ../shellkit-pm/
#1664359770
ls
#1664359775
lsg environ
#1664359783
cd ../shellkit-meta/
#1664359784
ls
#1664359792
git ls-files
#1664359799
cd ../bb-shellkit/
#1664359813
gpa Add prompt-command-wrap to workspace urls
#1664361190
clea
#1664361204
gs
#1664361209
cd localhist/
#1664361213
code -r .
#1664361223
pyenv shell 3.9.5
#1664361224
gs
#1664361227
git pull
#1664361229
gs
#1664361239
gco master 
#1664361239
gs
#1664361241
git pull
#1664361244
gs
#1664361246
gb
#1664361251
gb -d integrate-shellkit 
#1664361253
gs
#1664361272
cd ~/.localhist
#1664361274
lr
#1664361282
cd ~/.localhist-archive/
#1664361283
lr
#1664361297
d
#1664361300
cd /home/lmatheson4/projects/shellkit.workspace/localhist
#1664361302
d
#1664361303
lr
#1664361316
cd bin
#1664361317
ls
#1664361334
code lh_archive.mk 
#1664361407
gco -b archive-gen2
#1664361420
git push -u origin archive-gen2 
#1664361434
.`1
#1664361435
.1
#1664361437
cat version 
#1664361445
echo 2.1.0 > version 
#1664361449
make apply-version 
#1664361451
gs
#1664361463
gpa Bump to 2.1.0
#1664361544
gs
#1664361797
make build
#1664361801
make install-kit 
#1664361924
lr
#1664361927
cd bin
#1664361927
ls
#1664361933
./localhist-archive.sh --login
#1664361952
./localhist-archive.sh 
#1664362015
cd ~/.localhist
#1664362017
lr
#1664362036
less *
#1664362045
lr
#1664362054
d
#1664362057
cd /home/lmatheson4/projects/shellkit.workspace/localhist/bin
#1664362058
lr
#1664362059
d
#1664362061
lr
#1664362167
cd ~/.localhist-archive/
#1664362168
ls
#1664362172
cd PW0202FD/
#1664362172
ls
#1664362195
less *
#1664362246
cd shellkit.workspace/
#1664362248
mkae
#1664362249
make
#1664362261
make devcontainer-vscode-user 
#1664362480
exit
#1664362488
cd shellkit.workspace/
#1664362489
lr
#1664362559
pyenv shell 3.9.5
#1664362562
.1
#1664362578
pyenv shell 3.9.5
#1664362809
cd .local/bin/localhist/
#1664362810
ls
#1664362835
cd shellkit.workspace/localhist/
#1664362837
code .
#1664362887
make build
#1664362891
make install-kit 
exit
#1664362927
bash --norc
exit
#1664362947
bash --rcfile <(echo '#')
exit
#1664362962
bash --rcfile <(echo 'echo hello')
#1664363242
cd shellkit.workspace/
#1664363243
lr
#1664363247
code Makefile 
#1664363286
ls
#1664363292
code .devcontainer/Dockerfile 
#1664363325
make
#1664363571
ls
#1664363574
cd .devcontainer/
#1664363575
lr
#1664363580
tkr
#1664363581
tkr -h
#1664363585
tmk
#1664362124
loop /home/lmatheson4/projects/shellkit.workspace/localhist/bin/localhist-archive.sh 
#1664362569
make devcontainer-exec 
#1664362585
make devcontainer-exec 
#1664362497
make devcontainer-exec 
#1664362271
make devcontainer-exec 
#1664374597
cd localhist/
#1664374598
lr
#1664374602
gs
#1664374608
code .
#1664374756
pyenv shell 3.9.5
#1664374812
cd localhist/
#1664374812
ls
#1664374814
lr
#1664374820
ls -al
#1664374825
cd .devcontainer/
#1664374825
lr
#1664374833
code .
#1664374885
docker image ls | grep localhist
#1664374894
docker image ls | grep shellkit
#1664374905
docker tag 
#1664374950
docker tag shellkit-test-withtools:latest localhist-image-base:latest
#1664374960
grv
#1664374961
gs
#1664374962
lr
#1664374963
ls
#1664374999
.1
#1664375009
devcontainer open
#1664375070
env | grep prox
#1664375371
.1
#1664375372
ls
#1664375374
lr
#1664375864
cd .devcontainer/
#1664375865
lr
#1664375868
cd ..
#1664375871
vim bin/devcontainer-build-init.sh 
#1664386958
cat /etc/docker/daemon.json
#1664386967
cat /etc/docker/daemon.json | xclip
#1664388866
cd bas
#1664388868
ls
#1664388871
grv
#1664388876
git remote rename origin
#1664388883
git remote rename origin trnma
#1664388885
grv
#1664388887
.`1
#1664388888
.1
#1664388896
ls | grep bas
#1664388901
mkdir bas.workspace
#1664388910
mv bas bas.workspace/trnma.bas
#1664388912
cd  bas.workspace/trnma.bas
#1664388913
toa
#1664388914
lr
#1664389043
clear
#1664389043
lr
#1664389052
toa
#1664389053
lr
#1664389059
rosters
#1664389075
git remote add sep19 bbgithub:$sep19/bas
#1664389079
git fetch sep19
#1664389086
git reset --hard sep19/main
#1664389090
tig
#1664389100
git fetch trnma
#1664389102
tig
#1664389116
git merge -X ours trnma/main
#1664389119
tig
#1664389154
gs
#1664389161
git push -u sep19 main
#1664389283
gco -b lmatheson4-prep
#1664389285
lr
#1664389299
cd labs/currencies-schema/
#1664389299
lr
#1664389304
code .
#1664389351
ls
#1664389357
mkdir me
#1664389359
cd me
#1664389363
tkr -n
#1664389443
gs
#1664389444
tig
#1664389615
make .flag/build
#1664389619
tkr
#1664389623
tmk .flag/build
#1664389714
lr
#1664389729
ls .flag/
#1664389735
gs
#1664389740
.1
#1664389740
gs
#1664389743
cd me
#1664389744
lr
#1664389754
ga taskrc taskrc.mk 
#1664389755
gs
#1664389764
gc -m "Add taskrc*"
#1664389765
gs
#1664389781
rm -rf .etc .flag .gitignore Dockerfile currsvc.xsd docker-compose.yaml 
#1664389782
lr
#1664389829
tmk .flag/build
#1664389893
lr
#1664389896
rm -rf bas-currencies/
#1664389900
tmk .flag/build
#1664389910
lr
#1664389912
gs
#1664389922
echo .flag >> .gitignore
#1664389925
cd bas-currencies/
#1664389926
lr
#1664389930
gs
#1664390035
.1
#1664390035
gs
#1664390036
ga .
#1664390037
gs
#1664390048
ga .
#1664390048
gs
#1664390051
gpa
#1664390061
git push -u sep19 lmatheson4-prep 
#1664390068
tig
#1664390074
gs
#1664390308
lr
#1664390312
cd bas-currencies/
#1664390313
lr
#1664390321
dc config
#1664390438
make .flag/schema-valid
#1664390440
.1
#1664390442
make .flag/schema-valid
#1664390448
tkr
#1664390451
tmk .flag/schema-valid
#1664390490
rm .flag/build
#1664390493
ls .flag
#1664390503
tmk .flag/build
#1664390559
h
#1664390568
cd /home/lmatheson4/projects/bas.workspace/trnma.bas/labs/currencies-schema/me # cdmark
#1664390583
# Prep to teach bas schema for sep19
#1664390584
lr
#1664390592
tmk .flag/schema-valid
#1664390599
ls .flag
#1664395625
tmk
#1664395665
tmk 
#1664395671
tmk validate-schema
#1664396132
cd bas-currencies/
#1664396137
dc down --remove-orphans
#1664396139
.1
#1664396143
tmk validate-schema
#1664396182
make clean
#1664396188
tmk clean
#1664396192
tmk validate-schema
#1664396216
cd bas-currencies/
#1664396222
dc build --pull
#1664396241
dc pull
#1664396245
dc build
#1664396250
.1
#1664396259
cd bas-currencies/
#1664396264
dc run --rm schema bash
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
#1664396407
dc run --rm schema bash
#1664396419
cat Dockerfile 
#1664396447
dc down --remove-orphans
#1664396481
docker pull artprod.inf.bloomberg.com/dpkg-python-development-base:3.10
#1664396499
docker image rm artprod.inf.bloomberg.com/dpkg-python-development-base:3.10
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
#1664396599
dc up
#1664396614
docker image rm artprod.dev.bloomberg.com/dpkg-python-development-base:3.10
#1664396622
dc build --pull
#1664396635
dc run --rm schema bash
#1664396641
.1
#1664396646
tmk
#1664396649
tmk validate-schema
#1664399056
gs
#1664399058
gdf
#1664399060
gpa
#1664399188
gs
#1664399188
lr
#1664399236
cd bas-currencies/
#1664399237
lr
#1664399243
less currsvc.xsd 
#1664399246
tig
#1664399352
gs
#1664399354
.1
#1664399355
gs
#1664399356
gpa
#1664399662
tmk
#1664399669
tmk validate-schema
#1664399717
gs
#1664399719
ga .
#1664399728
gpa Add currency request / response
#1664399800
gs
#1664400007
gpa
#1664400014
.1
#1664400014
lr
#1664400015
.1
#1664400016
lr
#1664400020
cd spot-rates/
#1664400021
lr
#1664400032
code -r .
#1664400044
lr
#1664400052
cd template
#1664400053
ls
#1664400055
.1
#1664400055
lr
#1664400059
code README.md 
#1664400081
ls
#1664400082
cd solution/
#1664400083
lr
#1664400085
cd client/
#1664400086
lr
#1664400088
.1
#1664400089
lr
#1664400089
.1
#1664400090
lr
#1664400092
cd temp
#1664400095
cd -
#1664400098
cd template
#1664400098
lr
#1664400102
dc build
#1664400540
lr
#1664400542
gs
#1664400577
.1
#1664400577
ls
#1664400581
mkdir me
#1664400582
cd me
#1664400585
toa
#1664400586
lr
#1664400590
tkr -n
#1664400598
code taskrc.mk 
#1664400756
tmk build
#1664400763
tmk .flag/build
#1664400774
tmk download
#1664400812
ls .flag/download 
#1664400815
ls bas-spot-rates/
#1664400859
make clean
#1664400861
tmk clean
#1664400864
tmk download
#1664400896
ls bas-spot-rates/
#1664400913
rm .flag/download 
#1664400941
lr
#1664400943
gs
#1664400944
lr
#1664400948
ga taskrc*
#1664400950
gs
#1664400965
rm -rf .etc client service docker-compose.yaml 
#1664400966
lr
#1664400971
rm -rf bas-spot-rates/
#1664400975
tmk download
#1664400977
ls
#1664400980
ls bas-spot-rates/
#1664401016
tmk
#1664401024
tmk .flag/build
#1664403080
lr
#1664403081
ls
#1664404510
cd bas
#1664404512
gs
#1664404523
cd labs/spot-rates/me/
#1664404523
lr
#1664404524
gs
#1664404528
cd bas
#1664404530
lr
#1664404534
cd bas-spot-rates/
#1664404534
lr
#1664404536
find
#1664404538
.1
#1664404539
gs
#1664404545
ls .flag/
#1664404554
echo '*' > .flag/.gitignore
#1664404554
gs
#1664404559
ga .
#1664404560
gs
#1664404570
gpa
#1664405977
cd
#1664393461
dev 0
#1664405988
exit
#1664148257
ls
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
