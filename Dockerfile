FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y python3
RUN apt-get install -y cmake
RUN apt-get install -y gcc-arm-none-eabi libnewlib-arm-none-eabi \
  && rm -rf /usr/lib/arm-none-eabi/newlib/thumb/v8* \
  /usr/lib/arm-none-eabi/newlib/thumb/v7e* \
  /usr/lib/arm-none-eabi/newlib/thumb/v7ve+simd \
  /usr/lib/arm-none-eabi/newlib/thumb/v7-a* \
  /usr/lib/arm-none-eabi/newlib/thumb/v7-r+fp.sp \
  /usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v7e* \
  /usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v7-a* \
  /usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v7+fp* \
  /usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v8*
  
VOLUME [ "/pico-sdk", "/project" ]

ENV PICO_SDK_PATH=/pico-sdk

WORKDIR /project
