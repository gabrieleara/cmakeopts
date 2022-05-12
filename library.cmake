# ======================================================== #
# ------------ Default Library Configuration ------------- #
# ======================================================== #

# This file is to be included in cmake files that want to
# define a library.

# Variables that need to be filled:
#
# - LIBRARY_NAME            The name of the library
#
# - LIBRARY_TYPE            STATIC | SHARED | MODULE
#
# - LIBRARY_VERSION         Library VERSION number
#
# - LIBRARY_SOVERSION       Library SOVERSION number
#
# - LIBRARY_SOURCE_FILES    List of source files for the library
#
# - LIBRARY_INCLUDEDIR      Directory for public library include files.
#                           Additional interface/private directories for include
#                           files can be added using the INTERFACE or PRIVATE
#                           keyword before specifying the directory, prefixed
#                           with "${CMAKE_CURRENT_SOURCE_DIR}/" .
#
# - LIBRARY_PROPERTIES      A list of properties to be set on the given library
#                           (optional)
#
# - LIBRARY_DEPENDENCIES    List of dependencies of the library (optional)

# Must use GNUInstallDirs to install libraries into correct
# locations on all platforms.
include(GNUInstallDirs)

add_library(${LIBRARY_NAME} ${LIBRARY_TYPE}
    ${LIBRARY_SOURCE_FILES}
)

# Setting the version of the shared library
set_target_properties(${LIBRARY_NAME} PROPERTIES
    VERSION ${LIBRARY_VERSION}
    SOVERSION ${LIBRARY_SOVERSION}
)

# Include paths for this library. PUBLIC headers are used both to compile this
# library and will be added to consumers' build paths when built using CMake. In
# this case, "${LIBRARY_INCLUDEDIR}" directory will be exported, while "private"
# directory will not and will only be used to build the library itself
target_include_directories(${LIBRARY_NAME}
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/${LIBRARY_INCLUDEDIR}
)

target_link_libraries(${LIBRARY_NAME}
    PUBLIC ${LIBRARY_DEPENDENCIES}
)

if(DEFINED LIBRARY_PROPERTIES)
    set_property(TARGET ${LIBRARY_NAME} PROPERTY ${LIBRARY_PROPERTIES})
endif()
