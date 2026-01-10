# ===================================================================
# Copyright © 2026 Sackey Ezekiel Etrue
# Distributed under the terms of the MIT license.
# ===================================================================

# Summary variables:
# - IMGUI_OS_<UNIX|MACOS|LINUX|WINDOWS|ANDROID|EMSCRIPTEN|BSD|WSL>
# - IMGUI_OS : canonical OS string

set(IMGUI_OS "unknown")

set(IMGUI_OS_BSD FALSE)
set(IMGUI_OS_WSL FALSE)
set(IMGUI_OS_UNIX FALSE)
set(IMGUI_OS_MACOS FALSE)
set(IMGUI_OS_LINUX FALSE)
set(IMGUI_OS_WINDOWS FALSE)
set(IMGUI_OS_ANDROID FALSE)
set(IMGUI_OS_EMSCRIPTEN FALSE)

# detect the OS
if(WIN32 OR CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(IMGUI_OS_WINDOWS TRUE)
    set(IMGUI_OS "windows")

    # Detect WSL: WSL sets an ENV var or uses Linux-style uname; CMake doesn't expose WSL directly,
    # but we can make a best-effort check via CMAKE_HOST_SYSTEM_NAME vs CMAKE_SYSTEM_NAME
    if(CMAKE_HOST_SYSTEM_NAME MATCHES "Linux" AND CMAKE_SYSTEM_NAME MATCHES "Linux" AND NOT MSVC)
        # When building under WSL with a Windows-targeted toolchain this may be true; expose a flag
        set(IMGUI_OS_WSL TRUE)
    endif()

elseif(APPLE OR CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(IMGUI_OS_MACOS TRUE)
    set(IMGUI_OS "macos")

elseif(EMSCRIPTEN OR CMAKE_SYSTEM_NAME MATCHES "Emscripten.*")
    set(IMGUI_OS_EMSCRIPTEN TRUE)
    set(IMGUI_OS "emscripten")

elseif(ANDROID OR CMAKE_SYSTEM_NAME STREQUAL "Android")
    set(IMGUI_OS_ANDROID TRUE)
    set(IMGUI_OS "android")

elseif(LINUX OR CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(IMGUI_OS_UNIX TRUE)
    set(IMGUI_OS_LINUX TRUE)
    set(IMGUI_OS "linux")

elseif(CMAKE_SYSTEM_NAME MATCHES "(FreeBSD|OpenBSD|NetBSD|BSD)")
    set(IMGUI_OS_UNIX TRUE)
    set(IMGUI_OS_BSD TRUE)
    set(IMGUI_OS "bsd")
endif()

# MinGW/Cygwin detection (best-effort)
if(MINGW)
    # Some toolchains define MINGW; expose a convenience variable
    set(IMGUI_OS_WINDOWS TRUE)
    set(IMGUI_OS "windows")
endif()
 
# Export canonical names
set(IMGUI_OS "${IMGUI_OS}" CACHE INTERNAL "Canonical OS string")
set(IMGUI_OS_UNIX "${IMGUI_OS_UNIX}" CACHE INTERNAL "Is a Unix-like OS?")
set(IMGUI_OS_MACOS "${IMGUI_OS_MACOS}" CACHE INTERNAL "Is macOS?")
set(IMGUI_OS_LINUX "${IMGUI_OS_LINUX}" CACHE INTERNAL "Is Linux?")
set(IMGUI_OS_WINDOWS "${IMGUI_OS_WINDOWS}" CACHE INTERNAL "Is Windows?")
set(IMGUI_OS_ANDROID "${IMGUI_OS_ANDROID}" CACHE INTERNAL "Is Android?")
set(IMGUI_OS_EMSCRIPTEN "${IMGUI_OS_EMSCRIPTEN}" CACHE INTERNAL "Is Emscripten?")
set(IMGUI_OS_BSD "${IMGUI_OS_BSD}" CACHE INTERNAL "Is BSD?")
set(IMGUI_OS_WSL "${IMGUI_OS_WSL}" CACHE INTERNAL "Is WSL?")