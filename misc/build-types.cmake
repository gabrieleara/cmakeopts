# ======================================================== #
# -------------- Build Types Configuration --------------- #
# ======================================================== #

# Default build type is release (with no debug information)
set(default_build_type "Release")

# List all build types
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
    set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE STRING
        "Choose the type of build." FORCE)
    # Set the possible values of build type for cmake-gui
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY
        STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

# # Add special flags for Debug/Release configurations
# if (CMAKE_BUILD_TYPE MATCHES "Debug") or (CMAKE_BUILD_TYPE MATCHES "RelWithDebInfo")
#     message("Debug added as a compilation flag")
#     add_compile_definitions(__DEBUG__)
#     # FIXME: remove this in favor of the more "standard" NDEBUG
# endif()
# if (CMAKE_BUILD_TYPE MATCHES "Release")
#     add_definitions(-DNDEBUG)
# endif()

# # Change configuration of optimization options for release
# # with debug information
# if(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
#     string(REGEX REPLACE "(\-O[0123456789])" ""
#         CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
#     string(REGEX REPLACE "(\-O[0123456789])" ""
#         CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO}")
#     set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} -O0")
#     set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO} -O0")
# endif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
