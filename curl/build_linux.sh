#!/bin/bash

curl_archive=curl-7.45.0.tar.gz
prebuilt_path=`pwd`/prebuilt/linux
openssl_prebuilt_path=`pwd`/../openssl/prebuilt/linux
toolchain="/opt/diablo-gcc-toolchain"

tar xf $curl_archive
cd curl-*

export PATH=$toolchain/bin:$PATH
export LDFLAGS="-L$openssl_prebuilt_path/lib -Wl,-rpath-link,${openssl_prebuilt_path}/lib"
export CPPFLAGS="-I$openssl_prebuilt_path/include -mfloat-abi=softfp -msoft-float -mfpu=neon -Os -fPIC"

./configure --host=arm-diablo-linux-gnueabi --with-ssl=$openssl_prebuilt_path --prefix=$prebuilt_path \
						--enable-debug \
						--disable-curldebug \
						--disable-cookies			\
						--disable-crypto-auth	\
						--disable-dict				\
						--disable-ftp 				\
						--disable-file				\
						--disable-gopher			\
						--disable-imap				\
						--disable-ipv6				\
						--disable-ldap 				\
						--disable-ldaps				\
						--disable-manual			\
						--disable-ntlm-wb			\
						--disable-pop3				\
						--disable-proxy				\
						--disable-rtsp				\
						--disable-smtp				\
						--disable-soname-bump	\
						--disable-sspi				\
						--disable-telnet			\
						--disable-tftp				\
						--disable-tls-srp			\
						--without-libidn			\
						--without-librtmp			\
						--without-libssh2 		\
						--without-nghttp2     \
						--without-winidn			\
						--without-zlib
make
mkdir -p $prebuilt_path
make install

cd ..
