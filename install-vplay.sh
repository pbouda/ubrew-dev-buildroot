#!/bin/bash

[ -z "$VPLAY_SDK_PATH" ] && VPLAY_SDK_PATH="~/V-PlaySDK"
[ -z "$BUILDROOT_PATH" ] && BUILDROOT_PATH="buildroot-qt-dev/buildroot-2015.05"

if [ ! -d "$VPLAY_SDK_PATH" ]; then
 echo "Could not find V-Play SDK. Make sure you installed the V-Play SDK and"
 echo "set the environment variable VPLAY_SDK_PATH."
 exit -1
fi

if [ ! -d "$BUILDROOT_PATH/output/host/usr/bin" ]; then
 echo "Could not find Buildroot. Make sure downloaded buildroot and built the"
 echo "toolchain. See buildroot-qt-dev/README.md to learn more."
 exit -1
fi

echo "Installing mkspecs..."
mkdir -p $BUILDROOT_PATH/output/host/usr/mkspecs/common/vplay
install $VPLAY_SDK_PATH/5.4/gcc_64/mkspecs/common/vplay/resources_user.qrc \
	$BUILDROOT_PATH/output/host/usr/mkspecs/common/vplay/
install $VPLAY_SDK_PATH/5.4/gcc_64/mkspecs/features/v-play.prf \
	$BUILDROOT_PATH/output/host/usr/mkspecs/features/

echo "Installing headers..."
mkdir -p $BUILDROOT_PATH/output/staging/usr/include/VPlay
install $VPLAY_SDK_PATH/5.4/gcc_64/include/VPlay/VPApplication \
	$BUILDROOT_PATH/output/staging/usr/include/VPlay/
install $VPLAY_SDK_PATH/5.4/gcc_64/include/VPlay/vpapplication.h \
	$BUILDROOT_PATH/output/staging/usr/include/VPlay/

echo "Installing license..."
mkdir -p $BUILDROOT_PATH/output/V-Play
install $VPLAY_SDK_PATH/V-Play/vplay_license.key \
	$BUILDROOT_PATH/output/V-Play/

echo "Downloading and installing libraries..."
wget -O lib.tar.gz "https://owncloud.cidles.eu/public.php?service=files&t=6bf47f5c5eb5a0f453ec1c5dad7d760e&download"
tar xzf lib.tar.gz
install libVPlay.a $BUILDROOT_PATH/output/staging/usr/lib/
install libVPlay_debug.a $BUILDROOT_PATH/output/staging/usr/lib/
