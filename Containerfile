FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    ruby-full \
    ruby-bundler \
    jekyll \
    build-essential \
    git \
    vim-tiny

EXPOSE 4000 35729

ENTRYPOINT ["/bin/bash"]
