FROM ubuntu:22.04
MAINTAINER Antonio Aloisio <gnuton@gnuton.org>
MAINTAINER Thomas Perl <m@thp.io>

env VITASDK /usr/local/vitasdk
env PATH ${PATH}:${VITASDK}/bin

WORKDIR /build

RUN \
    DEBIAN_FRONTEND=noninteractive && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    echo "UTC" > /etc/timezone && \
    echo "Installing dependencies..." && \
    apt-get update && \
    apt-get install -y sudo wget curl make git-core xz-utils python3 apt-transport-https ca-certificates gnupg software-properties-common cmake bzip2 && \
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
