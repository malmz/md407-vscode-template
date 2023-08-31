# Visual Studio Code template project for md407

This project includes a template for compiling c code for the Chalmers lab SOC md407.

The project uses cmake to generate build script that compile your code. These build script are as makefiles or optionally as ninja build files for a nice speed boost.

## Installation

### Windows

- Install `gcc` from [here](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads).
- Install `cmake` from [here](https://cmake.org/download/).
- (Optional) Install `ninja` from [here](https://github.com/ninja-build/ninja/releases).

### Mac

All dependencies can be installed with [brew](https://brew.sh).

```sh
brew install --cask gcc-arm-embedded
brew install cmake ninja
```

Alternatively they can be installed manually from [here (gcc)](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) and [here (cmake)](https://cmake.org/download/) and [here (ninja)](https://github.com/ninja-build/ninja/releases). Note, `brew` is highly recommended.

### Linux

Install `arm-none-eabi-gcc` toolchain, `cmake` and `ninja`. This is left as an exercise to the reader.

## Usage

Create a copy of the git repo from github by clicking `"Use this template"` and follow the guide there. Then clone your new repo locally.

Open the folder in Visual Studio Code, when prompted **install recommended extensions** and let Cmake-tools configure the workspace.

In the status bar at the bottom of the editor, click `"No active kit"` and choose your installed arm toolchain
