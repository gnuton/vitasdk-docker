[![Docker Pulls](https://img.shields.io/docker/pulls/gnuton/vitasdk-docker.svg)](https://hub.docker.com/r/gnuton/vitasdk-docker)

Vita SDK in a Docker Image
==========================
Just another Docker image containing the Vita SDK.

Quick start
---------------
Docker images are built on daily basis and always contain the latest nightly VitaSDK build.

    cd your-vita-project
    docker run -v "$PWD:/build/git" -it --rm gnuton/vitasdk-docker
    
Build the image
---------------
In case you wanna build the image by yourself instead of pulling it from docker hub:

    docker build -t vitasdk-docker .
    
Travis CI ♡ VitaSDK Docker
---------------
Building PS Vita apps in a docker container have several advantages:
 - More reliable - Travis from time to time fails to installd the VitaSDK
 - Faster - Installing the VitaSDK for every build it's really time consuming

If you are interested in this solution. please have a look at this [simple template](https://github.com/gnuton/vitasdk-docker-testapp-trevis)
