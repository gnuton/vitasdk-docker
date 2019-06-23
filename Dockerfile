FROM ubuntu:18.04
MAINTAINER Applelo

env VITASDK /usr/local/vitasdk
env CMAKE_PATH /usr/bin/cmake
env PATH ${PATH}:${VITASDK}/bin:${CMAKE_PATH}/bin
env CMAKE_INSTALL_SCRIPT=cmake-3.14.5-Linux-x86_64.sh

WORKDIR /build

RUN apt update && apt install -y sudo wget curl make git-core xz-utils python pkg-config

RUN mkdir /usr/bin/cmake

RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.5/${CMAKE_INSTALL_SCRIPT} && \
	chmod +x ${CMAKE_INSTALL_SCRIPT}  && \
	./${CMAKE_INSTALL_SCRIPT} --prefix=/usr/bin/cmake --skip-license

RUN \
    git clone https://github.com/vitasdk/vdpm && \
    cd vdpm && \
    ./bootstrap-vitasdk.sh && \
    ./install-all.sh