[![Docker Pulls](https://img.shields.io/docker/pulls/gnuton/vitasdk-docker.svg)](https://hub.docker.com/r/gnuton/vitasdk-docker)

♡ Vita SDK in a Docker Image ♡
==============================
An always up-to-date Docker image containing the Vita SDK built on top of Ubuntu.

♡ Why should I use PSVita SDK Docker images? ♡
-----------------------------------------------
Building PS Vita apps in a docker container have several advantages:
 - More reliable - Consistent building environment. You can run it in TravisCI, CircleCI or your local machine.
 - Faster - Installing the VitaSDK for every build it's really time consuming
 - Hassle free - Do not spend time in installing a working environment. All you need to build your PS Vita app is here.
 
♡ Quick start ♡
---------------
1. <b>Build a local project with Docker</b>
    ```bash
    cd your-vita-project
    docker run -v "$PWD:/build/git" -it --rm gnuton/vitasdk-docker
    ```
    It will downlaoad the latest PSVita SDK docker image, and mount your local dir where your project is and from there you can build it.
2. <b>Travis CI</b>
   Do you have a PS Vita project on GitHub? Look at this [simple template](https://github.com/gnuton/vitasdk-docker-testapp-trevis) or fork  it if it's a new project.
3. <b>Circle CI</b> TODO
    
Build the image
---------------
In case you REALLY REALLY wanna make changes to the Docker file itself and build it, please run:
```bash
    docker build -t vitasdk-docker .
```bash    
