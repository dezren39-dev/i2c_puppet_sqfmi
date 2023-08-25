#!/usr/bin/env bash

if [[ "$#" -gt 0 ]]; then
 printf "%s\n" "Arguments passed to \`build-with-docker.sh\`."
 printf "%s\n" "\"Clean Run\" triggered."
 if [[ "$user" != "$USER" && "$EUID" -ne 0 ]]; then
   printf "%s\n" "Triggered behavior requires root access."
   printf "%s\n" "Please re-execute with \`sudo\`."
   exit 1
 fi
 printf "%s\n" "Executing: \`rm -rf \"$(pwd)/build\"\`"
 rm -rf "$(pwd)/build"
 printf "%s\n" "Build directory deleted for \"Clean Run\"."
fi

# https://github.com/xingrz/rpi-pico-builder (original, public archive repo, available on docker hub)
# https://github.com/DJFliX/rpi-pico-builder (fork of original, smaller size, newer ubuntu version, available on docker hub)
docker run --rm -it \
 -v $(pwd)/3rdparty/pico-sdk:/pico-sdk \
 -v $(pwd):/project \
 djflix/rpi-pico-builder:latest \
 bash -c 'mkdir -p build && cd build && cmake -DPICO_BOARD=beepy .. && make clean && make'
