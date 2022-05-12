cmake_minimum_required(VERSION 3.16)

# Adding other configuration files
include(${CMAKE_CURRENT_LIST_DIR}/misc/build-types.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/misc/color.cmake)

# ------------------- Paths Management ------------------- #

# Install directory changes depending on build mode
if (CMAKE_BUILD_TYPE MATCHES "^[Dd]ebug")
    # During debug, the library will be installed into a local directory
    set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/_install CACHE PATH "" FORCE)
    set(CMAKE_INSTALL_INITDIR ${CMAKE_BINARY_DIR}/_install/init.d CACHE PATH "" FORCE)
else ()
    # This will install in /usr/lib and /usr/include
    set(CMAKE_INSTALL_PREFIX /usr CACHE PATH "" FORCE)
    set(CMAKE_INSTALL_INITDIR /etc/init.d CACHE PATH "" FORCE)
endif ()

# -------------------------------------------------------- #

# Specifies what to export when installing (using the
# directories provided by GNUInstallDirs)

# This module will export a set of variables containing
# paths in which stuff can be installed to. REQUIRED!
include(GNUInstallDirs)

# --------------------- Miscellanea ---------------------- #

# set(CMAKE_CXX_CLANG_TIDY
#     clang-tidy;
#     -header-filter=${CMAKE_CURRENT_SOURCE_DIR}/; # Should add the binary dir too
#     -fix;
#     -checks=*;)
# set(CMAKE_C_CLANG_TIDY ${CMAKE_CXX_CLANG_TIDY})

# -------------------- Subdirectories -------------------- #

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/docs)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/packaging)
