# Visual Studio Code template project for md407

This project includes a template for compiling c code for the Chalmers lab SOC md407.

The project uses cmake as its build system. Cmake does not build your project directly but instead generates build scripts that compile your code. These build script are either makefiles or optionally (but recommended) ninja build files. Ninja is technically optional but works better across operating systems, is newer and faster.

## Installation

### Windows

Download and install [gcc][gcc], [cmake][cmake] and (Recommended) [ninja][ninja]

There have been reports of this template working poorly on windows without `ninja` so it is strongly recommended to install.

### Mac

All dependencies can be installed with [brew][brew].

```sh
brew install --cask gcc-arm-embedded
brew install cmake ninja
```

Alternatively you can be manually install [gcc][gcc], [cmake][cmake] and [ninja][ninja].  
Note: `brew` is a great tool to install command line applications on mac and is highly recommended.

### Linux

Install `arm-none-eabi-gcc` toolchain, `cmake` and `ninja` with your package manager of choice. You chose linux, you can figure it out :)

## Usage

Create a copy of the git repo from GitHub by clicking `"Use this template"` and follow the guide there. Then clone your new repo locally.

Open the folder in Visual Studio Code, when prompted **install recommended extensions** and let Cmake-tools configure the workspace. If no prompt is visible, install the [C/C++ Extension Pack][ccppext]

In the status bar at the bottom of the editor, click `"No active kit"` and choose your installed arm toolchain

# Building

To build the project, either press the `build` button in the status bar at the bottom of the editor or open the command pallet with `ctrl/cmd+shift+p` and searching for the `CMake: Build` option.

[cmake]: https://cmake.org/download/
[gcc]: https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
[ninja]: https://github.com/ninja-build/ninja/releases
[brew]: https://brew.sh
[ccppext]: https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack
