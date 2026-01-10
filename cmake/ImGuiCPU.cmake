# ===================================================================
# Copyright © 2026 Sackey Ezekiel Etrue
# Distributed under the terms of the MIT license.
# ===================================================================

# Summary variables:
# - IMGUI_ARCH_<X86|X64|ARM32|ARM64|EMSCRIPTEN> : boolean flags
# - IMGUI_ARCH_BITS : number of bits for pointers (32/64)
# - IMGUI_ARCH : canonical string (x86, x64, armv7, arm64, emscripten)


set(IMGUI_ARCH_X86 FALSE)
set(IMGUI_ARCH_X64 FALSE)
set(IMGUI_ARCH_ARM32 FALSE)
set(IMGUI_ARCH_ARM64 FALSE)
set(IMGUI_ARCH_EMSCRIPTEN FALSE)


if(DEFINED CMAKE_SIZEOF_VOID_P)
    math(EXPR IMGUI_ARCH_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
else()
    set(IMGUI_ARCH_BITS 0)
endif()

set(IMGUI_ARCH "unknown")

# detect the OS
if(WIN32 AND CMAKE_GENERATOR_PLATFORM)
    # When generating for Windows we may have an explicit generator platform
    if(CMAKE_GENERATOR_PLATFORM MATCHES "ARM64" OR "${CMAKE_SYSTEM_PROCESSOR}" MATCHES "ARM64")
        set(IMGUI_ARCH_ARM64 TRUE)
        set(IMGUI_ARCH "arm64")
    elseif(IMGUI_ARCH_BITS EQUAL 32)
        set(IMGUI_ARCH_X86 TRUE)
        set(IMGUI_ARCH "x86")
    elseif(IMGUI_ARCH_BITS EQUAL 64)
        set(IMGUI_ARCH_X64 TRUE)
        set(IMGUI_ARCH "x64")
    endif()

elseif(APPLE AND CMAKE_OSX_ARCHITECTURES)
    # macOS multi-arch builds: examine the requested architectures
    foreach(OSX_ARCH IN LISTS CMAKE_OSX_ARCHITECTURES)
        if(OSX_ARCH STREQUAL "x86_64")
            set(IMGUI_ARCH_X64 TRUE)
            set(IMGUI_ARCH "x64")
        elseif(OSX_ARCH STREQUAL "arm64")
            set(IMGUI_ARCH_ARM64 TRUE)
            set(IMGUI_ARCH "arm64")
        endif()
    endforeach()

elseif(EMSCRIPTEN)
    set(IMGUI_ARCH_EMSCRIPTEN TRUE)
    set(IMGUI_ARCH "emscripten")

else()
    # Generic fallback using CMAKE_SYSTEM_PROCESSOR and pointer size
    if("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "^arm|ARM|aarch64")
        if(IMGUI_ARCH_BITS EQUAL 64)
            set(IMGUI_ARCH_ARM64 TRUE)
            set(IMGUI_ARCH "arm64")
        else()
            set(IMGUI_ARCH_ARM32 TRUE)
            set(IMGUI_ARCH "armv7")
        endif()
    elseif("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "^(x86_64|AMD64|amd64)$")
        set(IMGUI_ARCH_X64 TRUE)
        set(IMGUI_ARCH "x64")
    elseif("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "^(i[3456]86|x86)$")
        set(IMGUI_ARCH_X86 TRUE)
        set(IMGUI_ARCH "x86")
    endif()
endif()

# Export summary flags
set(IMGUI_ARCH_BITS "${IMGUI_ARCH_BITS}" CACHE INTERNAL "Pointer bit-size (32/64)")
set(IMGUI_ARCH "${IMGUI_ARCH}" CACHE INTERNAL "Canonical architecture string")
set(IMGUI_ARCH_X86 "${IMGUI_ARCH_X86}" CACHE INTERNAL "Is x86?")
set(IMGUI_ARCH_X64 "${IMGUI_ARCH_X64}" CACHE INTERNAL "Is x64?")
set(IMGUI_ARCH_ARM32 "${IMGUI_ARCH_ARM32}" CACHE INTERNAL "Is 32-bit ARM?")
set(IMGUI_ARCH_ARM64 "${IMGUI_ARCH_ARM64}" CACHE INTERNAL "Is 64-bit ARM?")
set(IMGUI_ARCH_EMSCRIPTEN "${IMGUI_ARCH_EMSCRIPTEN}" CACHE INTERNAL "Is Emscripten?")

