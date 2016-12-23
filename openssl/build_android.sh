#!/bin/bash

openssl_archive="openssl-1.0.2d.tar.gz"
prebuilt_path=`pwd`/prebuilt/android
toolchain="/opt/diablo-android-gcc-toolchain"

# extract source tarball
tar xf $openssl_archive
cd openssl-*
patch -p1 < ../diablo.patch

# configure for build
# from https://wiki.openssl.org/index.php/Android
export ANDROID_DEV=$toolchain/sysroot/usr
export PATH=$toolchain/bin:$PATH
CC=arm-linux-androideabi-gcc RANLIB=arm-linux-androideabi-ranlib ./Configure android-armv7 shared -g -Os -fPIC --openssldir=$prebuilt_path

# build and install
make
mkdir -p $prebuilt_path
make install_sw

cd ..
