#!/bin/bash

openssl_archive="openssl-1.0.2d.tar.gz"
prebuilt_path=`pwd`/prebuilt/linux
toolchain="/opt/diablo-gcc-toolchain"

# extract source tarball
tar xf $openssl_archive
cd openssl-*
patch -p1 < ../diablo.patch

# configure for build
export PATH=$toolchain/bin:$PATH
CC=arm-diablo-linux-gnueabi-gcc RANLIB=arm-diablo-linux-gnueabi-ranlib ./Configure linux-armv4 -march=armv7-a shared -mfloat-abi=softfp -msoft-float -mfpu=neon -g -Os -fPIC --openssldir=$prebuilt_path

# build and install
make
mkdir -p $prebuilt_path
make install_sw

cd ..
