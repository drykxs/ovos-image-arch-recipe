FROM manjarolinux/base:latest

RUN pacman --noconfirm -Syudd wget

RUN mkdir /build && \
    cd /build && \
    wget http://downloads.openvoiceos.com/Manjaro-ARM-minimal-rpi4-22.08.img.gz

RUN sudo pacman --noconfirm --nodeps -Syudd manjaro-arm-installer
RUN sudo pacman --noconfirm --nodeps -Syudd xz git gzip lsof psmisc python python-pip
RUN sudo pacman --noconfirm --nodeps -Syudd manjaro-tools-base-git

RUN pip install pytz requests --break-system-packages

COPY docker_overlay/ /
RUN chmod ugo+x -R /scripts/
RUN chmod ugo+x -R /overlays/

RUN mkdir -p /build
RUN mkdir -p /output

ENV OUTPUT_DIR=/output
ENV BUILD_DIR=/build
