# MyOS
[![Build](https://github.com/ahmadk953/MyOS/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/ahmadk953/MyOS/actions/workflows/build.yml)

> [!WARNING]
> Development of this project is currently paused.

A custom OS built in x86_64 assembly and C.

## Building and Running

First, you need to download and install the necessary dependencies:
```bash
sudo apt-get update && sudo apt-get install build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo nasm mtools qemu-system-x86 -y
```
Depending on you distribution of linux, you might have to change the package names (Ex. ``libgmp3-devl`` instead of ``libgmp3-dev``).

Next, you need to downlod and compile the toolchain using:
```bash
make -j{NUMBER_OF_CORES}
```
Making sure to replace {NUMBER_OF_CORES} with the number of CPU cores that your machine has (Ex. ``make -j16``) to speed up the building and compiling process (this can take a while, the more CPU cores you allocate, the faster the process is going to be). You only have to do this once, unless the toolchain version is updated.

After building the toolchain, run the following command to build the actual OS:
```bash
make -j{NUMBER_OF_CORES}
```
Again, making sure to replace {NUMBER_OF_CORES} with the number of CPU cores that your machine has. This process should take less than a few minutes (even if you don't allocate more than 1 CPU core).

To start the OS, run ``run.sh``. Running this shell script will launch the OS in Qemu.

## Contributing and Developing

### TODO: Finish this Section
