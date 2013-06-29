#!/bin/bash

set -e

mkdir -p android/libs/armeabi-v7a
mkdir -p android/obj/local/armeabi-v7a
CC="$NDK_TOOLCHAIN/bin/arm-linux-androideabi-gcc"
GO="`pwd`/go/bin/go"
CC=$CC GOPATH="`pwd`:$GOPATH" GOARCH=arm GOARM=7 CGO_ENABLED=1 $GO install $GOFLAGS -v -ldflags="-android -shared -extld $CC -extldflags '-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16'" -tags android goandroid
cp bin/linux_arm/goandroid android/libs/armeabi-v7a/libgoandroid.so
cp bin/linux_arm/goandroid android/obj/local/armeabi-v7a/libgoandroid.so
