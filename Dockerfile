FROM ubuntu:22.04
LABEL maintainer="Antonio Aloisio <gnuton@gnuton.org>, Thomas Perl <m@thp.io>"

ENV VITASDK=/usr/local/vitasdk
ENV PATH=${PATH}:${VITASDK}/bin

WORKDIR /build

RUN \
    DEBIAN_FRONTEND=noninteractive && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    echo "UTC" > /etc/timezone && \
    echo "Installing dependencies..." && \
    apt-get update && \
    apt-get install -y sudo wget curl make git-core xz-utils python3 apt-transport-https ca-certificates gnupg software-properties-common bzip2 && \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add - && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ jammy main' && \
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
