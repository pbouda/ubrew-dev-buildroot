#!/bin/bash

echo "Downloading Buildroot..."
cd buildroot-qt-dev
wget http://buildroot.net/downloads/buildroot-2015.05.tar.bz2
tar xjvf buildroot-2015.05.tar.bz2

echo "Configuring..."
cd buildroot-2015.05
make defconfig BR2_DEFCONFIG=../config/buildroot-raspi2.conf

echo "Installing gamepad patch to qtbase..."
install ../../package/qt5/qt5base/0008-gamepad_device.patch package/qt5/qt5base/

echo "Starting build, this may take a while..."
make

cd ../..
