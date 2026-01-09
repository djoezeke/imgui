# ===================================================================
# Copyright © 2026 Sackey Ezekiel Etrue
# Distributed under the terms of the MIT license.
# ===================================================================

set(IMGUI_COMPILER_GCC FALSE)
set(IMGUI_COMPILER_MSVC FALSE)
set(IMGUI_COMPILER_CLANG FALSE)
set(IMGUI_COMPILER_MSVC_CLANG FALSE)

# detect the compiler
# Note: The detection is order is important because:
# - Visual Studio can both use MSVC and Clang
# - GNUCXX can still be set on macOS when using Clang
if(MSVC)
    set(SFML_COMPILER_MSVC TRUE)

    # Visual Studio 2019 v16.2 added support for Clang/LLVM.
    # Check if a Visual Studio project is being generated with the Clang toolset.
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang|^Intel$")
        set(IMGUI_COMPILER_MSVC_CLANG TRUE)
    endif()
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang|^Intel$")
    set(IMGUI_COMPILER_CLANG TRUE)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    set(IMGUI_COMPILER_GCC TRUE)
else()
    message(WARNING "Unrecognized compiler: ${CMAKE_CXX_COMPILER_ID}. Use at your own risk.")
endif()