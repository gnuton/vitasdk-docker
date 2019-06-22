FROM ubuntu:xenial
MAINTAINER Applelo

env VITASDK /usr/local/vitasdk
env PATH ${PATH}:${VITASDK}/bin

WORKDIR /build

RUN apt-get update \
	&& apt-get install -y \
    	software-properties-common \
    	wget \
	&& add-apt-repository -y ppa:ubuntu-toolchain-r/test \
	&& apt-get update \
	&& apt-get install -y sudo cmake \
	&& apt-get install -y sudo curl make git-core xz-utils python
	

RUN apt install -y sudo wget curl make git-core xz-utils python

RUN \
    git clone https://github.com/vitasdk/vdpm && \
    cd vdpm && \
    ./bootstrap-vitasdk.sh && \
    ./install-all.sh

