#!/bin/bash

[ -z "$BUILDROOT_PATH" ] && BUILDROOT_PATH="buildroot-qt-dev/buildroot-2015.05"

if [ ! -d "$BUILDROOT_PATH/output/host/usr/bin" ]; then
  echo "Could not find Buildroot. Make sure downloaded buildroot and built the"
  echo "toolchain. See buildroot-qt-dev/README.md to learn more."
  exit -1
fi

echo "Installing package files..."
mkdir -p $BUILDROOT_PATH/package/ubrew
cp -r package/ubrew/* $BUILDROOT_PATH/package/ubrew/

# Save current path
current_dir=$(pwd)
cd $BUILDROOT_PATH

echo "Building qt5gamepad..."
make qt5gamepad

echo "Building libpnd..."
make libpnd

echo "Building libpndman..."
make libpndman

echo "Building qt5pndman..."
make qt5pndman

echo "Building panorama..."
make panorama

cd $current_dir
