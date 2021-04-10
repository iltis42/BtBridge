git pull
VER=`date +"%y.%m%d-%H%M"`
comment=$1
touch ./main/Version.h
idf.py build
cp ./build/sensor.bin  ./images/sensor-${VER}.bin
git add ./images/sensor-${VER}.bin
git commit -a -m "new version: sensor-${VER}.bin; Changes: $comment"
git push
git tag -a v${VER} -m "$comment"
