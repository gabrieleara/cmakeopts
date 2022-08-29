# NOTE: to use this in combination with the cmake-builder script, remember to
# place the following block in your root CMakeLists.txt:
# # Set to ON to build and later run automated testing
# if(BUILD_TESTING)
#     enable_testing()
#     include(cmakeopts/misc/test.cmake)
#     # Your testing targets configuration (or subdirectory)
# endif()


# ---------------- Google Test Dependency ---------------- #
include(FetchContent)
FetchContent_Declare(
  googletest
#  URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.12.1
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# -------------- Google Test Configuration --------------- #

include(GoogleTest)
