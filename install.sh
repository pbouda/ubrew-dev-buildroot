#!/bin/bash

[ -z "$VPLAY_SDK_PATH" ] && VPLAY_SDK_PATH="~/V-PlaySDK"

if [ ! -d "$VPLAY_SDK_PATH" ]; then
 echo "Could not find V-Play SDK. Make sure you installed the V-Play SDK and"
 echo "set the environment variable VPLAY_SDK_PATH."
 exit -1
fi

./install-buildroot.sh
./install-qt5gamepad.sh
./install-vplay.sh