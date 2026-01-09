# ===================================================================
# Copyright © 2026 Sackey Ezekiel Etrue
# Distributed under the terms of the MIT license.
# ===================================================================

set(IMGUI_OS_UNIX FALSE)
set(IMGUI_OS_MACOS FALSE)
set(IMGUI_OS_LINUX FALSE)
set(IMGUI_OS_WINDOWS FALSE)
set(IMGUI_OS_ANDROID FALSE)
set(IMGUI_OS_EMSCRIPTEN FALSE)

# detect the OS
if(WIN32 OR CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(SFML_OS_WINDOWS TRUE)
elseif(LINUX OR CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(IMGUI_OS_UNIX TRUE)

    if(ANDROID)
        set(IMGUI_OS_ANDROID TRUE)
    else()
        set(IMGUI_OS_LINUX TRUE)
    endif()
elseif(APPLE OR CMAKE_SYSTEM_NAME STREQUAL "(Darwin|MacOS)")
    set(IMGUI_OS_MACOS TRUE)
elseif(ANDROID OR CMAKE_SYSTEM_NAME STREQUAL "Android")
    set(IMGUI_OS_ANDROID TRUE)
elseif(EMSCRIPTEN OR CMAKE_SYSTEM_NAME MATCHES "Emscripten.*")
    set(IMGUI_OS_EMSCRIPTEN TRUE)
endif()