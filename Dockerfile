FROM ubuntu:18.04
MAINTAINER Antonio Aloisio <gnuton@gnuton.org>
MAINTAINER Thomas Perl <m@thp.io>

env VITASDK /usr/local/vitasdk
env PATH ${PATH}:${VITASDK}/bin

WORKDIR /build

RUN \
    DEBIAN_FRONTEND=noninteractive && \
    echo "Installing dependencies..." && \
    apt-get update && \
    apt-get install -y sudo wget curl make git-core xz-utils python apt-transport-https ca-certificates gnupg software-properties-common wget && \
    echo "Installing Latest CMake Version..." && \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add - && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
    apt-get update && \
    apt-get install -y cmake && \
    echo "Adding non-root user..." && \
    useradd -ms /bin/bash user && \
    echo "user:user" | chpasswd && adduser user sudo

RUN \
    git clone https://github.com/vitasdk/vdpm && \
    cd vdpm && \
    ./bootstrap-vitasdk.sh && \
    ./install-all.sh

USER root
CMD ["/bin/bash"]
