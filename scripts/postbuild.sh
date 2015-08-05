#!/bin/bash

echo "Installing panorama files..."
install -m 755 ../../userland/target/pnd_run.sh $1/usr/bin/
install -m 755 ../../userland/target/S99panorama $1/etc/init.d/
