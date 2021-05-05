# Futhark-GPU
A containerized installation of the Futhark programming language with GPU support (OpenCL and CUDA). GPU support is based on [`nvidia-docker`](https://github.com/NVIDIA/nvidia-docker) under Linux, which is a prerequisite along with a compatible Nvidia graphics driver -- you do not need to install the CUDA or OpenCL toolchain on the host system. In theory it should work on [Windows using WSL](https://docs.nvidia.com/cuda/wsl-user-guide/index.html), but likely not out of the box.

## Installation
There are no pre-built tarballs or container registry entries maintained at the moment. Just build the latest version directly from Github:

``` docker build https://github.com/CarHol/Futhark-GPU.git -t carhol/futhark-gpu ```

## Basic usage
You can either use a container interactively for experimentation or as part of your build chain. To try out Futhark interactively:

```docker run -it carhol/futhark-gpu futhark repl```
