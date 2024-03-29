# ======================================================== #
# --------------- Packaging Configuration ---------------- #
# ======================================================== #

# TODO: all packages are not signed as of now, check this
# page to add signature capabilities
# https://cmake.org/cmake/help/latest/cpack_gen/productbuild.html

# FIXME: read some of the values from the project conf or add custom variables

# Common options for all generators
set(CPACK_PACKAGE_NAME ${CMAKE_PROJECT_NAME})
# set(CPACK_PACKAGE_VENDOR "Retis Lab@Scuola Superiore Sant'Anna")
# set(CPACK_PACKAGE_CONTACT "Gabriele Ara (gabriele.ara@santannapisa.it)")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY ${PROJECT_DESCRIPTION})
set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_RESOURCE_FILE_LICENSE ${PROJECT_SOURCE_DIR}/LICENSE)
set(CPACK_RESOURCE_FILE_README ${PROJECT_SOURCE_DIR}/README.md)

set(CPACK_PACKAGE_FILE_NAME
    ${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${CMAKE_HOST_SYSTEM_PROCESSOR}
)

set(CPACK_SOURCE_PACKAGE_FILE_NAME
    ${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-src
)

# Directories to ignore when building a `source` package
set(CPACK_SOURCE_IGNORE_FILES
    /.git
    /dist
    /.*build.*
    /\\\\.DS_Store
)

unset(CPACK_GENERATOR)
unset(CPACK_SOURCE_GENERATOR)

# Each generator will have its own options (they will
# auto-include in the list of active generators too)
include(${CMAKE_CURRENT_LIST_DIR}/archives/CMakeLists.txt)
include(${CMAKE_CURRENT_LIST_DIR}/deb/CMakeLists.txt)
include(${CMAKE_CURRENT_LIST_DIR}/rpm/CMakeLists.txt)

# Including the CPack module will then handle everything
include(CPack)
