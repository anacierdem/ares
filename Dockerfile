FROM ubuntu:24.04

# install ares dependencies
RUN apt-get update && apt-get install \
    # Build system
    build-essential \
    cmake \
    pkg-config \
    curl \
    git \
    # clang, ninja, ccache
    clang \
    ninja-build \
    ccache \
    # ares deps
    libgtk-3-dev \
    libcanberra-gtk-module \
    libgl-dev \
    # audio
    libasound2-dev \
    libao-dev \
    libopenal-dev \
    libpulse-dev \
    libudev-dev \
    -yq

USER ubuntu

WORKDIR /ares

COPY --chown=ubuntu:ubuntu . .

WORKDIR /ares/build
RUN cmake .. -G Ninja -DARES_CORES="n64"
RUN cmake --build .