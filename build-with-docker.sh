#!/usr/bin/env bash

if [[ "$#" -gt 0 ]]; then
 rm -rf $(pwd)/build
fi

# https://github.com/xingrz/rpi-pico-builder (original, public archive repo, available on docker hub)
# https://github.com/DJFliX/rpi-pico-builder (fork of original, smaller size, newer ubuntu version, available on docker hub)
docker run --rm -it \
 -v $(pwd)/3rdparty/pico-sdk:/pico-sdk \
 -v $(pwd):/project \
 djflix/rpi-pico-builder:latest \
 bash -c 'mkdir -p build && cd build && cmake -DPICO_BOARD=beepy .. && make clean && make'
