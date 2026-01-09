# ===================================================================
# Copyright © 2026 Sackey Ezekiel Etrue
# Distributed under the terms of the MIT license.
# ===================================================================

set(IMGUI_ARCH_X86 FALSE)
set(IMGUI_ARCH_X64 FALSE)
set(IMGUI_ARCH_ARM32 FALSE)
set(IMGUI_ARCH_ARM64 FALSE)
set(IMGUI_ARCH_EMSCRIPTEN FALSE)

# detect the OS
if(WIN32 AND CMAKE_GENERATOR_PLATFORM)

    if(CMAKE_GENERATOR_PLATFORM MATCHES "ARM64" OR "${CMAKE_SYSTEM_PROCESSOR}" MATCHES "ARM64")
        set(IMGUI_ARCH_ARM64 TRUE)
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        set(IMGUI_ARCH_X86 TRUE)
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(IMGUI_ARCH_X64 TRUE)
    endif()

elseif(APPLE AND CMAKE_OSX_ARCHITECTURES)

    foreach(OSX_ARCH IN LISTS CMAKE_OSX_ARCHITECTURES)
        
        if(OSX_ARCH STREQUAL "x86_64")
            set(IMGUI_ARCH_X64 TRUE)
        elseif(OSX_ARCH STREQUAL "arm64")
            set(IMGUI_ARCH_ARM64 TRUE)
        endif()

    endforeach()

endif()

