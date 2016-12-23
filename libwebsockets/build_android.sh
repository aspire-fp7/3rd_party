#!/bin/bash

archive="libwebsockets-1.5-chrome47-firefox41.tar.gz"
prebuilt_path=`pwd`/prebuilt/android
toolchain_file=`pwd`/cross-arm-android.cmake
toolchain="/opt/diablo-android-gcc-toolchain"

tar xf $archive
cd libwebsockets-*

mkdir build
cd build

cmake .. 													\
			-DCMAKE_INSTALL_PREFIX:PATH=$prebuilt_path \
			-DCMAKE_TOOLCHAIN_FILE=$toolchain_file \
			-DCMAKE_C_FLAGS="-mfloat-abi=softfp -msoft-float -mfpu=neon -g -Os -fPIC" \
			-DLWS_WITHOUT_SERVER=1\
			-DLWS_WITHOUT_DAEMONIZE=0\
			-DLWS_WITHOUT_EXTENSIONS=0\
			-DLWS_WITH_HTTP2=0 					\
			-DLWS_WITH_SSL=0 						\
			-DLWS_WITH_ZLIB=0 					\
			-DLWS_WITHOUT_EXTENSIONS=1	\
			-DLWS_WITHOUT_TESTAPPS=1

make
mkdir -p $prebuilt_path
make install
