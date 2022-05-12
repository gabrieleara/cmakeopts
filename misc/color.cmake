# ======================================================== #
# ---------- Colored Build Output Configuration ---------- #
# ======================================================== #

option (CMAKE_FORCE_COLORED_OUTPUT
    "Always produce ANSI-colored output (GNU/Clang only)." FALSE)

if (${CMAKE_FORCE_COLORED_OUTPUT})
    if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        # Matches both Clang and AppleClang
        add_compile_options (-fcolor-diagnostics)
    elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        add_compile_options (-fdiagnostics-color=always)
    elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
        # Using Intel C++, not supported
    elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        # Using Visual Studio C++ compiler
    endif()
endif()
