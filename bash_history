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
#1629375197
cd /c/Projects/localhist && docker run --name lhtest -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 bash -c 'cd bin; ./setup.sh; echo ">> Use \"docksh lhtest\" in another terminal for testing, we are asleep here"; sleep infinity' # Run setup.sh locally in a docker container, with sleep. vx1
#1629378223
cd /c/Projects/localhist/publish && ./publish-via-github-release.sh  # publish-now
