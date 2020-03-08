FROM archlinux/base

ENV container=docker
ENV HUGO_VERSION 0.66.0

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/wULLSnpAXbWZGYDYyhWTKKspEQoaYxXyhoisqHf/docker-archlinux-hugo.git" \
      org.label-schema.vcs-ref=$VCS_REF

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz ./hugo.tar.gz


RUN pacman -Syu --noconfirm --needed git openssh rsync \
    && pacman -Scc \
    && rm -rfv /var/cache/pacman/* /var/lib/pacman/sync/*

RUN bsdtar xfv hugo.tar.gz && rm -v hugo.tar.gz README.md LICENSE \
    && mv -v hugo /usr/local/bin/
