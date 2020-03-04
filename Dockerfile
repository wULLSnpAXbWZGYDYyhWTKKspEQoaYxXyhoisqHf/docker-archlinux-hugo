FROM archlinux/base

ENV container=docker

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/wULLSnpAXbWZGYDYyhWTKKspEQoaYxXyhoisqHf/docker-archlinux-hugo.git" \
      org.label-schema.vcs-ref=$VCS_REF

RUN pacman -Syu --noconfirm --needed wget tar git \
    && pacman -Scc \
    && rm -rfv /var/cache/pacman/* /var/lib/pacman/sync/*

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.66.0/hugo_extended_0.66.0_Linux-64bit.tar.gz -O hugo.tgz \
    && tar xfv hugo.tgz && rm -v hugo.tgz README.md LICENSE \
    && mv -v hugo /usr/local/bin/
