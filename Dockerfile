FROM ubuntu:18.04
MAINTAINER Thomas Perl <m@thp.io>

env VITASDK /usr/local/vitasdk
env PATH ${PATH}:${VITASDK}/bin

WORKDIR /build

RUN apt-get install software-properties-common
RUN add-apt-repository ppa:george-edison55/cmake-3.x

RUN apt update && apt install -y sudo wget curl make git-core cmake xz-utils python

RUN \
    git clone https://github.com/vitasdk/vdpm && \
    cd vdpm && \
    ./bootstrap-vitasdk.sh && \
    ./install-all.sh

