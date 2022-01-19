# Download base image Ubuntu 20.04
FROM ubuntu:20.04
MAINTAINER jlj@ctrl-c.club

LABEL maintainer="jlj@ctrl-c.club"
LABEL version="1.1"
LABEL description="This is a custom Docker \
image forked from Santi Regueiro's repo."

# Disable prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y calibre && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

EXPOSE 8080

RUN mkdir -p /opt/calibre/library && \
    mkdir /data

VOLUME ["/opt/calibre/library", \
    "/data"]

ENTRYPOINT ["/usr/bin/calibre-server", \
            "/opt/calibre/library"]
CMD ["--enable-auth", \
     "--auth-mode=basic", \
     "--userdb=/data/users.sqlite"]
