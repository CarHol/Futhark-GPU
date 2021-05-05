FROM nvidia/cuda:11.3.0-devel-ubuntu20.04

# Install basics
RUN apt update && \
    apt upgrade -y && \
    apt install -y wget curl git

# Instal build dependencies
RUN apt install -y libtinfo-dev libgmp-dev

# Install OpenCL
RUN apt install -y ocl-icd-opencl-dev

# Install Haskell and stack
RUN curl -sSL https://get.haskellstack.org/ | sh

# Install Futhark to bin
ENV PATH="/root/local/bin:$PATH"
RUN mkdir /temp && \
    cd /temp && \
    wget https://futhark-lang.org/releases/futhark-nightly-linux-x86_64.tar.xz && \
    tar -xf ./futhark-nightly-linux-x86_64.tar.xz && \
    cd futhark-nightly-linux-x86_64 && \
    make install

# Create source volume root
RUN mkdir -p /src
WORKDIR /src

# Map cuda directories compatible with Futhark
ENV LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64/:$LD_LIBRARY_PATH
ENV CPATH=/usr/local/cuda/include:$CPATH
