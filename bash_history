#1629378223
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ #
docker run -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 # Testing localhist setup
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ # dockinit
cd /c/Projects/localhist/publish && ./publish-via-github-release.sh  # publish-now
cd /c/Projects/localhist && docker run --name lhtest -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 bash -c 'cd bin; ./setup.sh; echo ">> Use \"docksh lhtest\" in another terminal for testing, we are asleep here"; sleep infinity' # Run setup.sh locally in a docker container, with sleep. vx1
#1629380432
gpa "Cleanup bash_history"
#1629380332
lh e
#1629380455
cd /c/Projects/localhist/publish && ./publish-via-github-release.sh  # publish-now
#1629383120
apt install httpie
#1629383124
sudo apt install httpie
#1629383136
httpie
#1629383147
http
#1629454425
h
#1629454433
gs
#1629454444
cat bash_history 
#1629454701
lr
#1629379438
bash -l
#1629379438
bash -l
#1629379438
bash -l
#1629454790
lh 
#1629454796
lh --help
#1629454943
cd .taskrc
#1629454944
lr
#1629454947
cat history.taskrc 
#1629454952
rm history.taskrc 
#1629454959
cat localhist.taskrc 
#1629454972
cd .bash_completion.d/
#1629454973
lr
#1629454978
rm localhist-completion.bash 
#1629454993
clear
#1629454993
lr
#1629455018
exec bash
#1629455022
cd
#1629455027
localhist
#1629455033
code ~/.bashrc
#1629455115
lr
#1629455116
gs
#1629455117
lr
#1629455123
exec bash
#1629455128
localhist
#1629455133
type -a localhist
#1629455141
cd .taskrc
#1629455141
lr
#1629455148
grep localhist *
#1629455152
cd bin
#1629455154
lr
#1629455161
exit
#1629455020
bash -l
#1629455162
exit
#1629455164
exit
#1629455499
HISTFILE=/c/Projects/localhist/bash_history 
#1629455500
lr
#1629455507
h -r
#1629455507
h -r
#1629455513
lr
#1629455516
h
#1629455518
hist
#1629457369
git show HEAD
#1629457394
git rev-parse HEAD
#1629457397
tig
#1629461331
lr
#1629461334
gs
#1629461342
cd bin
#1629461347
gs .
#1629461350
gs
#1629461363
gs . | wc -l 
#1629461370
gs -s . | wc -l
#1629461375
gs -s  | wc -l
#1629461475
gs
#1629461490
echo hashfile >> .gitignore
#1629461491
gs
#1629461494
ga .gitignore 
#1629461557
cd ../publish/
#1629461558
lr
#1629461560
./publish-via-github-release.sh 
#1629461592
(cd ../bin; gs)
#1629461609
./publish-via-github-release.sh 
#1629461634
cd ../bin
#1629461635
gs
