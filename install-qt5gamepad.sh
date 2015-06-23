#!/bin/bash

[ -z "$BUILDROOT_PATH" ] && BUILDROOT_PATH="buildroot-qt-dev/buildroot-2015.05"

if [ ! -d "$BUILDROOT_PATH/output/host/usr/bin" ]; then
 echo "Could not find Buildroot. Make sure downloaded buildroot and built the"
 echo "toolchain. See buildroot-qt-dev/README.md to learn more."
 exit -1
fi

echo "Installing package files..."
mkdir -p $BUILDROOT_PATH/package/qt5/qt5gamepad
install package/qt5/qt5gamepad/Config.in $BUILDROOT_PATH/package/qt5/qt5gamepad/
install package/qt5/qt5gamepad/qt5gamepad.mk \
	$BUILDROOT_PATH/package/qt5/qt5gamepad/

current_dir=$(pwd)
echo "Building qt5gamepad..."
cd $BUILDROOT_PATH
make qt5gamepad
cd $current_dir
