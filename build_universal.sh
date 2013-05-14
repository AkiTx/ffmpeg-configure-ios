#!/bin/tcsh -f

source ./build_armv7s
source ./build_armv7

if (! -d universal) mkdir universal
if (! -d lib) mkdir lib

rm universal/*.a

lipo -create armv7s/libavcodec.a armv7/libavcodec.a i386/libavcodec.a -output universal/libavcodec.a
lipo -create armv7s/libavdevice.a armv7/libavdevice.a i386/libavdevice.a -output universal/libavdevice.a
lipo -create armv7s/libavformat.a armv7/libavformat.a i386/libavformat.a -output universal/libavformat.a
lipo -create armv7s/libavutil.a armv7/libavutil.a i386/libavutil.a -output universal/libavutil.a
lipo -create armv7s/libswscale.a armv7/libswscale.a i386/libswscale.a -output universal/libswscale.a

rm lib/*.a

cp universal/*.a lib/
