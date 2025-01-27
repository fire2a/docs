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

COPY serve.sh /serve.sh
RUN chmod +x /serve.sh

COPY build_n_serve.sh /build_n_serve.sh
RUN chmod +x /build_n_serve.sh

EXPOSE 4000 35729

CMD ["/build_n_serve.sh"]
