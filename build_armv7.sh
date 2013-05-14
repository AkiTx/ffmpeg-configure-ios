#!/bin/tcsh -f

if (! -d armv7) mkdir armv7
if (! -d lib) mkdir lib

rm armv7/*.a

make clean

./configure \
--enable-libx264 \
--enable-gpl \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffserver \
--enable-cross-compile \
--arch=arm \
--target-os=darwin \
--cc=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc \
--as='gas-preprocessor/gas-preprocessor.pl /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc' \
--sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk \
--cpu=cortex-a8 \
--extra-cflags='-arch armv7' \
--extra-ldflags='-arch armv7' \
--enable-pic \
--extra-ldflags=-L/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk/usr/lib/system \
--extra-cflags=-I/Users/liulei/Desktop/svn/LiaoVideoCoder/x264 \
--extra-ldflags=-L/Users/liulei/Desktop/svn/LiaoVideoCoder/x264 \
--enable-small \
--disable-debug \
--disable-doc 

make

mv libavcodec/libavcodec.a armv7/
mv libavdevice/libavdevice.a armv7/
mv libavformat/libavformat.a armv7/
mv libavutil/libavutil.a armv7/
mv libswscale/libswscale.a armv7/

rm lib/*.a

cp armv7/*.a lib/

