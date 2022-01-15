FROM immawanderer/archlinux:linux-amd64

ENV HUGO_VERSION 0.92.0

ARG BUILD_DATE
ARG VCS_REF

LABEL description="Docker image for building websites with Hugo static site generator."

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://git.dotya.ml/wanderer/docker-archlinux-hugo.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.license=GPL-3.0

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp/hugo.tar.gz

WORKDIR /tmp/
RUN pacman -Syu --noconfirm --needed git
RUN pacman --noconfirm -Rn "$(pacman -Qdtq)" || true
RUN bsdtar xfv /tmp/hugo.tar.gz && rm -v /tmp/hugo.tar.gz README.md LICENSE \
    && chmod +x /tmp/hugo \
    && mkdir -pv /usr/local/bin \
    && mv -v /tmp/hugo /usr/local/bin/
RUN pacman -Scc && rm -rf /var/cache/pacman/* /var/lib/pacman/sync/* \
    && rm -rf /usr/share/zoneinfo/* ; \
    rm -rf /usr/share/i18n/* ;rm -rf /usr/include/* ; \
    find /. -name "*~" -type f -delete; \
    find /usr/share/terminfo/. ! -name "*xterm*" ! -name "*screen*" ! -name "*screen*" -type f -delete
WORKDIR /
