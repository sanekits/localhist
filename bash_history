vi ~/.local/bin/localhist/localhist #
vim ~/.local/bin/localhist/localhist #
set -o vi #
CDPATH=:/root:/workarea:/ #
alias lr='ls -lrta' #
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ #
HISTFILE=/workarea/bash_history  # Switching from /root/.bash_history
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ # dockinit
#1629374848
docker run -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 # Testing localhist setup
#1629374904
cd /c/Projects/localhist && docker run --name lhtest -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 bash -c 'cd bin; ./setup.sh; echo ">> Use \"docksh lhtest\" in another terminal for testing, we are asleep here"; sleep infinity' # Run setup.sh locally in a docker container, with sleep. vx1
#1629375185
h
#1629375185
h
#1629375230
cat bash_history
#1629375248
lh j e
#1629375267
lr
lr
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ # dockinit
lr
lh
lh e foo
lh x foo
exit
#1629375422
docksh lhtest
#1629375512
lh x foo
#1629375577
lh x ~/tmp/foo
#1629375594
exec bash
#1629375598
lh x ~/tmp/foo
#1629375615
source bin/localhist
#1629375620
lh x ~/tmp/foo
#1629375785
source bin/localhist
#1629375789
lh x ~/tmp/foo
#1629375833
source bin/localhist
#1629375836
lh x ~/tmp/foo
#1629375846
cd bin
#1629375848
./setup.sh
#1629375852
exec bash
#1629375855
.1
#1629375858
source bin/localhist
#1629375864
lh x ~/tmp/foo
#1629375886
source bin/localhist
#1629375888
lh x ~/tmp/foo
#1629375916
cat /tmp/foo
#1629375920
cat ~/tmp/foo
#1629375925
gs
#1629375927
gdf
#1629375939
gpa Bugfix export command
#1629375947
docksh  lhtest
#1629375197
cd /c/Projects/localhist && docker run --name lhtest -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 bash -c 'cd bin; ./setup.sh; echo ">> Use \"docksh lhtest\" in another terminal for testing, we are asleep here"; sleep infinity' # Run setup.sh locally in a docker container, with sleep. vx1
cd /c/Projects/localhist && docker run --name lhtest -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 bash -c 'cd bin; ./setup.sh; echo ">> Use \"docksh lhtest\" in another terminal for testing, we are asleep here"; sleep infinity' # Run setup.sh locally in a docker container, with sleep. vx1
lr foo
source bin/localhist
lh x foo2
source bin/localhist
exit
exit
source bin/localhist
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ # dockinit
lr
rm foo*
lr
lr
lh x /tmp/foo
lh x /tmp/foo asdf
exit
exit
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ # dockinit
lr
lh
h
lh e
lh t
cd
mkdir -p /tmp/foo1/foo2/foo3
cd /tmp/foo1
cd /tmp/foo1
cd /tmp/foo
cd /tmp
mkdir -p /tmp/foo1/foo2/foo3
cd tmp/foo1
cd /tmp/foo1
lr
lr
source bin/localhist
cd /tmp/foo1
lr
cd ~/.local/bin
HISTFILE=/workarea/bash_history
lh r
ls -al
cd localhist
ls
exit
exit
h
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ # dockinit
lr
bin/setup.sh
lh j
lh
lh
lh
h
h
exit
bash -l
exit
#1629378173
gs
#1629378175
gs
#1629378181
gpa More bug fixes
#1629378188
cd publish/
#1629378196
lr
#1629378205
cd $PWD && ./publish-via-github-release.sh
#1629378223
cd /c/Projects/localhist/publish && ./publish-via-github-release.sh  # publish-now
#1629378232
hg
#1629378233
h
#1629378259
lh e
#1629378281
lr
#1629378287
.1
#1629378287
lr
#1629378289
gs
#1629378293
ga -f bash_history 
#1629378294
gs
#1629378298
vim .gitignore 
#1629378304
gs
