# Electrostatic-Library
> A library template utilizing the Electrostatic-Sandbox SDK, acting as an extension pack.

This is a template that builds a cross-platform native library for Linux variants, Android variants, and AVR MCU variants linking them against the Electrostatic-Sandbox SDK libraries. The library is built into static archives, and dynamic libraries. The template is also provided by `examples` module in which a single source file with a `main` function could be compiled and run on its respective system.

<img width="1147" height="290" alt="image" src="https://github.com/user-attachments/assets/d2b9a685-a063-4bf1-b0ee-bf4ce5e1d4f4" />

## System Requirements
1) A GNU/Linux System or a WSL System.
2) A minimum of 1GB RAM, and 4GB Disk Space.
3) If planned Microcontroller development; ATMega32 and/or ATMega328p are the currently supported ones.
4) If planned Android development; all Android variants are supported.

## Setup the Electrostatic Environment
This will install missing dependencies (CLI tools and toolchains) in `/opt/electrostatic-sandbox` that shall be utilized by the SDK build front-end and CMake to build the applications.

```bash
chmod +rwx ./helper-scripts/setup-environment/setup-sandbox.sh && \
           ./helper-scripts/setup-environment/setup-sandbox.sh
```

## Build the application binary (.elf)
This will build the application binary to all supported platforms; usually if a new build routine is to be built, it has to go here.

```bash
chmod +x ./helper-scripts/project-impl/compile-all.sh && \
         ./helper-scripts/project-impl/compile-all.sh 
```

## Introducing other building routines using Bash
Introducing other building routines is far easy. However, it's mostly dependent on whether the original SDK is supporting those platforms. If not yet, you will have to build a pre-compilation header that excludes the SDK for those unsupported systems or else you will get linking errors.

Usually the build routines will look like that in general:
https://github.com/Electrostat-Lab/Electrostatic-Library/blob/a6d9669dde096c02285e28c5657aa2438793b367/helper-scripts/project-impl/compile-all-linux.sh#L1-L17

They are dependent on that abstraction: 
https://github.com/Electrostat-Lab/Electrostatic-Library/blob/a6d9669dde096c02285e28c5657aa2438793b367/helper-scripts/abstract/abstract-compile.sh#L1-L41

## Changing the project output name
This could be attained by changing the variable `COMMISSION_LIB` and `COMMISSION_LIB_AR` in the `./helper-scripts/project-impl/variables.sh`:
https://github.com/Electrostat-Lab/Electrostatic-Library/blob/a6d9669dde096c02285e28c5657aa2438793b367/helper-scripts/project-impl/variables.sh#L8-L9

## Adding new dependencies
Add your dependencies in the `libs` directory with the system directory of choice if required (in case of platform-dependent binaries); the build script finds all libraries listed under this directory through this code snippet:
https://github.com/Electrostat-Lab/Electrostatic-Library/blob/a6d9669dde096c02285e28c5657aa2438793b367/helper-scripts/project-impl/compile-electrostatic.sh#L27-L38

## Adding new examples to test the introduced APIs
* Adding new examples could be achieved by creating new source code (single source files) under the `examples` module, and using the following command to compile and run the example:
```bash
$ ./helper-scripts/project-impl/compile-examples.sh "-m64" "main.cpp" "executable-example" "linux" "x86-64" "x86-64/exe"
$ ./cmake-build/linux/x86-64/exe/executable-example.elf
```
> [!NOTE]
> This command links the specified source example against the `Electrostatic-Sandbox SDK` libraries and the `Electroextension` library (your native library).

* Adding new examples for microcontroller programming is much the same, but will require uploading as a post-compilation script.

## Excluding parts of the source code (dissociating the source code into modules)
This could be attained through the build routines of the supported systems by decomposing the source directory into sub-directories and pass them as source modules to the compilation front-end (Ccoffee); the following shows the use of all the source code as a single module:
https://github.com/Electrostat-Lab/Electrostatic-Library/blob/a6d9669dde096c02285e28c5657aa2438793b367/helper-scripts/project-impl/compile-all-android.sh#L4-L12

## Build front-end automata, CMake, and Toolchains
Essentially, the build architecture of the Electrostatic-Sandbox SDK is based on the idea of creating a front-end scripted API that creates a building automata, which entails taking an input and passing into a chain of states, and eventually ending with a terminal state; thus the recognition of the machine to the building holds if the terminal state is being reached by the program counter. The initial input to the automata is mainly a building routine instruction and the outputs are proceeded and could be found at the filesystems cmake-build and build, where the terminal output is produced.

The build of the Electrostatic-applications is much simpler than the SDK; it's literally a subset of it.

For more; refer to the [build architecture of the Electrostatic-Sandbox SDK](https://github.com/Electrostat-Lab/Electrostatic-Sandbox/blob/master/electrostatic-sandbox-framework/docs/system-build/architecture.md).
