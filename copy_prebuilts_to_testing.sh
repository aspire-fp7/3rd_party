#!/bin/bash
target=../../testing/3rd_party

cd $(dirname $0)

for system in linux android serverlinux; do
  cp -R curl/$system/include $target/curl/$system/
  cp libwebsockets/$system/include/*.h $target/libwebsockets/$system/include/
  cp -R openssl/$system/include $target/openssl/$system/

  for ext in a so; do
	cp curl/$system/lib/libcurl.$ext $target/curl/$system/lib/

	cp openssl/$system/lib/libcrypto.$ext $target/openssl/$system/lib/
	cp openssl/$system/lib/libssl.$ext $target/openssl/$system/lib/

	cp libwebsockets/$system/lib/libwebsockets.$ext $target/libwebsockets/$system/lib/
  done
done
