#1629378223
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ #
docker run -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 # Testing localhist setup
set -o vi ; alias lr='ls -lrta' ; CDPATH=:/root:/workarea:/ # dockinit
cd /c/Projects/localhist/publish && ./publish-via-github-release.sh  # publish-now
cd /c/Projects/localhist && docker run --name lhtest -v `pwd`:/workarea -w /workarea --rm -it  artprod.dev.bloomberg.com/dpkg-python-development-base:3.9 bash -c 'cd bin; ./setup.sh; echo ">> Use \"docksh lhtest\" in another terminal for testing, we are asleep here"; sleep infinity' # Run setup.sh locally in a docker container, with sleep. vx1
