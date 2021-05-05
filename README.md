# Futhark-GPU
A containerized installation of the Futhark programming language with GPU support (OpenCL and CUDA). GPU support is based on [`nvidia-docker`](https://github.com/NVIDIA/nvidia-docker) under Linux, which is a prerequisite along with a compatible Nvidia graphics driver -- you do not need to install the CUDA or OpenCL toolchain on the host system. In theory it should work on [Windows using WSL](https://docs.nvidia.com/cuda/wsl-user-guide/index.html), but likely not out of the box.

## Installation
There are no pre-built tarballs or container registry entries maintained at the moment. Just build the latest version directly from GitHub:

``` docker build https://github.com/CarHol/Futhark-GPU.git -t carhol/futhark-gpu ```

## Basic usage
The default source directory in the container is `/src` - your host sources directory can be mounted as a volume to this directory. You can either use a container interactively for experimentation or as part of your build chain. To try out Futhark interactively:

```docker run -it --gpus all carhol/futhark-gpu futhark repl```

To use Futhark from an interactive bash session, where you can compile and test your project from a terminal:

```docker run -it --gpus all -v /path/on/host:/src -w /src carhol/futhark-gpu bash```

From the interactive shell, you can then confirm that all source files are found and build them using `futhark cuda`, `futhark opencl` or any other compiler version you prefer.

If you don't have a compatible GPU or `nvidia-docker` installation, you can omit the `--gpus all` argument to run the container in CPU mode.
