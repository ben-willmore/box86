#!/bin/bash

#git clone https://github.com/ptitSeb/box86.git
#cd box86

git checkout mirror

mkdir build-nightly && cd build-nightly
CC=arm-linux-gnueabihf-gcc-10 CXX=arm-linux-gnueabihf-g++-10 cmake .. \
  -DARM64=1 -DARM_DYNAREC=ON
make -j8
make install

mkdir products
cp -r /usr/local/bin/box86 ./products/
cp -r /usr/lib/box86-i386-linux-gnu ./products/

mkdir -p ./products/etc/binfmt.d
cp /etc/binfmt.d/box86.conf ./products/etc/binfmt.d/
cp /etc/box86.box86rc ./products/etc/

mkdir final
mv products final/box86
cd final
zip -r box86.zip box86
