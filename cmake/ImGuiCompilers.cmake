# ===================================================================
# Copyright © 2026 Sackey Ezekiel Etrue
# Distributed under the terms of the MIT license.
# ===================================================================

# Human-friendly summary variables:
# - IMGUI_COMPILER_<GCC|MSVC|CLANG|MSVC_CLANG> : boolean flags for the detected compiler/toolset
# - IMGUI_COMPILER_ID : same value as CMAKE_CXX_COMPILER_ID (string)
# - IMGUI_COMPILER_VERSION : same as CMAKE_CXX_COMPILER_VERSION when available

set(IMGUI_COMPILER_GCC FALSE)
set(IMGUI_COMPILER_MSVC FALSE)
set(IMGUI_COMPILER_CLANG FALSE)
set(IMGUI_COMPILER_MSVC_CLANG FALSE)

set(IMGUI_COMPILER_ID "${CMAKE_CXX_COMPILER_ID}")
if(DEFINED CMAKE_CXX_COMPILER_VERSION)
    set(IMGUI_COMPILER_VERSION "${CMAKE_CXX_COMPILER_VERSION}")
else()
    set(IMGUI_COMPILER_VERSION "unknown")
endif()

# detect the compiler
# Note: The detection is order is important because:
# - Visual Studio can both use MSVC and Clang
# - GNUCXX can still be set on macOS when using Clang
if(MSVC)
    # Standard MSVC (Visual Studio) toolset
    set(IMGUI_COMPILER_MSVC TRUE)

    # Visual Studio can be configured to use the Clang toolset (Clang-cl).
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES "^Intel$")
        set(IMGUI_COMPILER_MSVC_CLANG TRUE)
    endif()
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    # Clang (including AppleClang when on Apple platforms)
    set(IMGUI_COMPILER_CLANG TRUE)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    # GNU GCC
    set(IMGUI_COMPILER_GCC TRUE)
else()
    message(WARNING "Unrecognized compiler: ${CMAKE_CXX_COMPILER_ID}. Use at your own risk.")
endif()

# Convenience booleans
if(IMGUI_COMPILER_MSVC_CLANG)
    # When Clang is used through MSVC toolset, also expose the generic flags
    set(IMGUI_COMPILER_CLANG TRUE)
endif()

# Export summary (cache/internal) to make it easy for other CMakeLists to consume
set(IMGUI_COMPILER_ID "${IMGUI_COMPILER_ID}" CACHE INTERNAL "Detected C++ compiler id")
set(IMGUI_COMPILER_VERSION "${IMGUI_COMPILER_VERSION}" CACHE INTERNAL "Detected C++ compiler version")
set(IMGUI_COMPILER_GCC "${IMGUI_COMPILER_GCC}" CACHE INTERNAL "Is GCC?")
set(IMGUI_COMPILER_MSVC "${IMGUI_COMPILER_MSVC}" CACHE INTERNAL "Is MSVC?")
set(IMGUI_COMPILER_CLANG "${IMGUI_COMPILER_CLANG}" CACHE INTERNAL "Is Clang?")
set(IMGUI_COMPILER_MSVC_CLANG "${IMGUI_COMPILER_MSVC_CLANG}" CACHE INTERNAL "Is MSVC using Clang toolset?")