calibre-server-docker
=====================

Docker container with calibre pre-installed.


Getting the image
-----------------
You can pull it from ``https://hub.docker.com/repository/docker/jlj7/calibre-server-docker`` or clone this repo and build it.

All you need is the Dockerfile.


Using your library
------------------

This container exposes the volumes **/opt/calibre/library** and **/data**, and the port **8080**

To allow calibre to run **your library** you have to **mount it as a volume** with ``-v /your/library/location:/opt/calibre/library``

Note that I've enabled basic authentication by default, as I share my library with friends; it expects the credentials in **/data/users.sqlite**. (You can create this file with the ``--manage-users`` option; see [the server documentation for details](https://manual.calibre-ebook.com/server.html#managing-user-accounts-from-the-command-line-only).

To override this behaviour, simply pass your library on the command-line, as outlined just above.


Running the container
------------------------

    docker run -p 80:8080 -v /media/calibre/books:/opt/calibre/library -name calibre regueiro/calibre-server

From now on:

    docker start calibre

You can pass arguments to calibre-server:

    docker run -p 80:8080 -v /media/calibre/books:/opt/calibre/library -name calibre regueiro/calibre-server --username user --password pass
