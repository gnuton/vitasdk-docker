[![Docker Pulls](https://img.shields.io/docker/pulls/gnuton/vitasdk-docker.svg)](https://hub.docker.com/r/gnuton/vitasdk-docker)
[![CircleCI](https://circleci.com/gh/gnuton/vitasdk-docker/tree/master.svg?style=svg)](https://circleci.com/gh/gnuton/vitasdk-docker/tree/master)

♡ Vita SDK in a Docker Image ♡
==============================
Daily fresh Vita SDK Docker images.

Features
--------
* Image based on Ubuntu 22.04
* Always with latest stable CMake
* Docker images are built every night at midnight
* Versioned Nightlies
* Tested on the most popular CI/CD envs (Travis/CircleCI/Azure/...) 

Why should I use PSVita SDK Docker images?
-----------------------------------------------
Building PS Vita apps in a docker container have several advantages:
 - More reliable - Consistent building environment. You can run it in TravisCI, CircleCI or your local machine.
 - Faster - Installing the VitaSDK for every build it's really time consuming
 - Hassle free - Do not spend time in setting up a working environment. All you need to build your PS Vita app is this image.
 
Quick start
---------------
1. <b>Build a local project with Docker</b>
    ```bash
    cd your-vita-project
    docker run -v "$PWD:/build/git" -it --rm gnuton/vitasdk-docker
    ```
    It will downlaoad the latest PSVita SDK docker image, and mount your local dir where your project is and from there you can build it.
2. <b>Travis CI</b>
   Do you have a PS Vita project on GitHub? Look at this [simple template](https://github.com/gnuton/vitasdk-docker-testapp-trevis) or fork  it if it's a new project.
3. <b>Azure pipelines</b> here is a [sample](https://github.com/devnoname120/vhbb/blob/master/azure-pipelines.yml)
4. <b>Circle CI</b> TODO

Versioned Nightlies
----------------------
Every day at midnight CI scripts craft a new juicy docker image with the latest snapshot of VitaSDK.
If you wanna build your code always against the latest cutting-edge VitaSDK code, please get gnuton/vitasdk-docker:<b>latest</b> images.
Otherwise, you can stick to a specific image version too (eg gnuton/vitasdk-docker:<b>20190626</b> for the 2019-06-26 snapshot).
The list of available image versions can be found [here](https://cloud.docker.com/repository/registry-1.docker.io/gnuton/vitasdk-docker/tags).

Build the image
--------------------
In case you REALLY REALLY wanna make changes to the Docker file itself and build it, please run:
```bash
    docker build -t vitasdk-docker .
``` 
