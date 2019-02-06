![alt text](https://img.shields.io/docker/automated/gnuton/vitasdk-docker.svg?style=flat)
![alt text](https://img.shields.io/docker/build/gnuton/vitasdk-docker.svg?style=flat)


Vita SDK in a Docker Image
==========================

This is based on [pspdev-docker](https://github.com/pspdev/pspdev-docker).

Get the image
---------------

    docker pull gnuton/vitasdk-docker


Build the image
---------------

    docker build -t vitasdk-docker .

Symlink the helper script
-------------------------

Assuming you have a `~/.local/bin` folder and it's in your `$PATH`:

    ln -s $(pwd)/vitasdk-docker ~/.local/bin

Alternatively, you can also copy the script somewhere.

Using it
--------

The directory where you run the script gets exposed to the
Docker image as `/build/`, and this is also the working
directory. This allows you to run e.g.:

    vitasdk-docker make

You can also just run a shell by running it without args:

    vitasdk-docker

Note that only the current folder is exported, so you can't
do a `cmake ..` in a build folder, for this, use the shell:

    vitasdk-docker
    mkdir build
    cd build
    cmake ..

Once this is set up, you can use the script from outside
(again, from the parent folder, so it can find source files):

    vitasdk-docker make -C build

Saving and loading
------------------

Save the image:

    docker save vitasdk-docker | bzip2 > vitasdk-docker.tar.bz2

Load the image:

    docker load < bzip2 -dc vitasdk-docker.tar.bz2
