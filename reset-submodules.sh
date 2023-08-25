#!/usr/bin/env bash

git submodule foreach git reset --hard

cd 3rdparty/pico-sdk

git submodule foreach git reset --hard

cd lib/tinyusb

git submodule foreach git reset --hard

cd ../../../..

