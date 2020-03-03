FROM archlinux
RUN pacman -Syu --noconfirm --needed wget tar git \
    && pacman -Scc \
    && rm -rfv /var/cache/pacman/* /var/lib/pacman/sync/* \
    && wget https://github.com/gohugoio/hugo/releases/download/v0.66.0/hugo_extended_0.66.0_Linux-64bit.tar.gz -O hugo.tgz \
    && tar xfv hugo.tgz \
    && mv -v hugo /usr/local/bin/ && rm -v hugo.tgz README.md LICENSE
