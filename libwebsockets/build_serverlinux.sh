#!/bin/bash

archive="libwebsockets-1.5-chrome47-firefox41.tar.gz"
prebuilt_path=`pwd`/prebuilt/serverlinux
# toolchain_file=`pwd`/cross-arm-linux.cmake
# toolchain="/opt/diablo-gcc-toolchain"

tar xf $archive
cd libwebsockets-*

mkdir build
cd build

cmake .. 													\
			-DCMAKE_INSTALL_PREFIX:PATH=$prebuilt_path \
			-DCMAKE_C_FLAGS="-g -Os" \
			-DLWS_WITH_HTTP2=0 					\
			-DLWS_WITH_SSL=0 						\
			-DLWS_WITH_ZLIB=0 					\
			-DLWS_WITHOUT_EXTENSIONS=1

make
mkdir -p $prebuilt_path
make install
