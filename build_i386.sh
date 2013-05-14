#!/bin/tcsh -f

if (! -d i386) mkdir i386
if (! -d lib) mkdir lib

rm i386/*.a

make clean

./configure --disable-doc --disable-ffmpeg --disable-ffplay --disable-ffserver --disable-debug --enable-cross-compile --disable-armv5te --enable-pic --cc=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc --as='gas-preprocessor/gas-preprocessor.pl /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc' --extra-ldflags=-L/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.1.sdk/usr/lib/system --sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.1.sdk --target-os=darwin --arch=i386 --cpu=i386 --extra-cflags='-arch i386' --extra-ldflags='-arch i386' --disable-asm

make

mv libavcodec/libavcodec.a i386/
mv libavdevice/libavdevice.a i386/
mv libavformat/libavformat.a i386/
mv libavutil/libavutil.a i386/
mv libswscale/libswscale.a i386/

rm lib/*.a

cp i386/*.a lib/
