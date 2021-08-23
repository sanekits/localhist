docker run -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 # Testing localhist setup
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ # dockinit
source ~/.bashrc # reload localhist_add prototype
source ~/.bashrc ; localhist_add -h #
source ~/.bashrc ; localhist_add -c -f foo #
source ~/.bashrc ; localhist_add -c -f README.md #
#1629378223
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ #
#1629378223
cd /c/Projects/localhist && docker run --name lhtest -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 bash -c 'cd bin; ./setup.sh; echo ">> Use \"docksh lhtest\" in another terminal for testing, we are asleep here"; sleep infinity' # Run setup.sh locally in a docker container, with sleep. vx1
#1629538260
makeself.sh /c/Projects/localhist/bin ./tmp/localhist-0.8.0.run "Installing localhist-0.8.0" ./setup.sh  # Publish localhist with makself
#1629560637
cd /c/Projects/localhist && docker run --name lhtest -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 /bin/bash -c '/workarea/tmp/localhist-setup-0.8.1.sh; echo ">> Use \"docksh lhtest\" in another terminal for testing, we are asleep here"; sleep infinity' # Run localhist-setup-vvv.setup.sh locally in a docker container, with sleep. vx2
#1629744313
(cd /c/Projects/localhist/publish && ./publish-via-github-release.sh ) # publish-now
#1629744333
( cd tmp; ./localhist-setup-0.9.0.sh ) # install localhist
#1629744396
lh e
