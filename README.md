[
  ![alt text](https://img.shields.io/docker/automated/gnuton/vitasdk-docker.svg?style=flat)
  ![alt text](https://img.shields.io/docker/build/gnuton/vitasdk-docker.svg?style=flat)
](https://cloud.docker.com/repository/docker/gnuton/vitasdk-docker/builds)
[![Docker Pulls](https://img.shields.io/docker/pulls/gnuton/vitasdk-docker.svg)](https://hub.docker.com/r/gnuton/vitasdk-docker)

Vita SDK in a Docker Image
==========================
Just another Docker image containing the Vita SDK.

Quick start
---------------

    cd your-vita-project
    docker run -v "$PWD:/build" -it gnuton/vitasdk-docker

Build the image
---------------
In case you wanna build the image by yourself instead of pulling it from docker hub:

    docker build -t vitasdk-docker .
    
    
