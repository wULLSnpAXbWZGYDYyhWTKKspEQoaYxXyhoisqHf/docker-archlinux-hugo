FROM archlinux:latest

ENV HUGO_VERSION 0.69.1

ARG BUILD_DATE
ARG VCS_REF

LABEL description="Docker image for building websites with Hugo static site generator."

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/wULLSnpAXbWZGYDYyhWTKKspEQoaYxXyhoisqHf/docker-archlinux-hugo.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.license=GPL-3.0

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz ./hugo.tar.gz

WORKDIR /tmp/
RUN bsdtar xfv hugo.tar.gz && rm -v hugo.tar.gz README.md LICENSE \
    && mv -v hugo /usr/local/bin/

RUN pacman -Sy --noconfirm --needed git && pacman --noconfirm -R $(pacman -Qdtq)
RUN pacman --noconfirm -Runs \
    gzip less sysfsutils which \
    && pacman --noconfirm -Runs tar gawk || true \
    && pacman -Scc && rm -rfv /var/cache/pacman/* /var/lib/pacman/sync/*
    && rm -rv /usr/share/info/* \
    && rm -rv /usr/share/man/* \
    && rm -rv /usr/share/doc/* \
    && rm -rv /usr/share/zoneinfo/* \
    && rm -rv /usr/share/i18n/* \
    && find /. -name "*~" -type f -delete \
    && find /usr/share/terminfo/. ! -name "*xterm*" ! -name "*screen*" ! -name "*screen*" -type f -delete \
    && rm -rv /tmp/* \
    && rm -rv /usr/include/*
WORKDIR /
