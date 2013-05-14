#!/bin/tcsh -f

if (! -d armv7s) mkdir armv7s
if (! -d lib) mkdir lib

rm armv7s/*.a

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
--extra-cflags='-arch armv7s' \
--extra-ldflags='-arch armv7s' \
--enable-pic \
--extra-ldflags=-L/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk/usr/lib/system \
--extra-cflags=-I/Users/liulei/Desktop/svn/LiaoVideoCoder/x264 \
--extra-ldflags=-L/Users/liulei/Desktop/svn/LiaoVideoCoder/x264 \
--enable-small \
--disable-debug \
--disable-doc 

make

mv libavcodec/libavcodec.a armv7s/
mv libavdevice/libavdevice.a armv7s/
mv libavformat/libavformat.a armv7s/
mv libavutil/libavutil.a armv7s/
mv libswscale/libswscale.a armv7s/

rm lib/*.a

cp armv7s/*.a lib/

