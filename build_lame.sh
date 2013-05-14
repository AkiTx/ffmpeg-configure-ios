#!/bin/bash

SDK_VERSION="6.1"

mkdir build

rm build/*

function build_lame()
{
    make distclean

    ./configure \
        CFLAGS="-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/${SDK}.platform/Developer/SDKs/${SDK}${SDK_VERSION}.sdk" \
        CC="/Applications/Xcode.app/Contents/Developer/Platforms/${SDK}.platform/Developer/usr/bin/gcc -arch ${PLATFORM}" \
        --host="arm-apple-darwin9" \
        --disable-shared \
        --enable-static \
        --disable-decoder \
        --disable-frontend

    make
    cp "libmp3lame/.libs/libmp3lame.a" "build/libmp3lame-${PLATFORM}.a"
}

PLATFORM="i686"
SDK="iPhoneSimulator"
build_lame

PLATFORM="armv7"
SDK="iPhoneOS"
build_lame

PLATFORM="armv7s"
build_lame

lipo -create build/* -output build/libmp3lame.a
