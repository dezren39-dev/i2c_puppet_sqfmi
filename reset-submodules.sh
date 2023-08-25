#!/usr/bin/env bash

git submodule foreach git submodule foreach git reset --hard
git submodule foreach git submodule foreach git reset --hard
git submodule foreach git reset --hard

git submodule update -- "3rdparty/pico-sdk"

cd  3rdparty/pico-sdk

git submodule update -- "lib/tinyusb"

cd ../..
