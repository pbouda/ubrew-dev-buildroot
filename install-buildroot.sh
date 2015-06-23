#!/bin/bash

cd buildroot-qt-dev
wget http://buildroot.net/downloads/buildroot-2015.05.tar.bz2
tar xjvf buildroot-2015.05.tar.bz2

cd buildroot-2015.05
make defconfig BR2_DEFCONFIG=../config/buildroot-raspi2.conf
make

cd ../..
