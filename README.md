# CMakeOpts

A set of overly reused options for CMake-based projects

# Usage

To set up a CMake project to use these options, follow these steps:

1. Add this project as a submodule dependency in git:
```bash
git submodule init
git submodule add https://github.com/gabrieleara/cmakeopts.git
```

2. Add the options to your main `CMakeLists.txt` like in the following example:
```cmake
cmake_minimum_required(VERSION 3.16)

project(
    proj-name
    VERSION 0.1
    DESCRIPTION ""
    LANGUAGES CXX
)

# ...

# Include main options for CMake
include(cmakeopts/CMakeLists.txt)

# Add targets from here, using either add_executable,
# add_directory, add_library, etc.
```

3. Make a symbolic link to the builder script (optional):
```bash
ln -s cmakeopts/builder.py builder.py
```

You can now build your project using:
```bash
./builder.py build
```

> Note that the builder script expects to be run in a direct subdirectory of the
> project main directory (as set up in step 1).
