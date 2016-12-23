#!/bin/bash

openssl_archive="openssl-1.0.2d.tar.gz"
prebuilt_path=`pwd`/prebuilt/serverlinux
# toolchain="/opt/diablo-gcc-toolchain"

# extract source tarball
tar xf $openssl_archive
cd openssl-*
# patch -p1 < ../diablo.patch

# configure for build
# export PATH=$toolchain/bin:$PATH
CC=gcc RANLIB=ranlib ./Configure linux-x86_64 shared -g -Os --openssldir=$prebuilt_path

# build and install
make
mkdir -p $prebuilt_path
make install_sw

cd ..
