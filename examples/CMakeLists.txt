# ===================================================================
# Copyright © 2026 Sackey Ezekiel Etrue
# Distributed under the terms of the MIT license.
# ===================================================================

#--------------------------------------------------------------------
# Examples CMakeLists
#
# This file exposes one option per example, grouped by platform/type.
# Each option defaults to OFF. Set the option to ON to include the example
# subdirectory in the build (via `-D<OPTION>=ON` or a parent CMakeLists).
#
# The helper function `imguizmo_set_option` is used to define options and
# generate consistent documentation. Each option follows the pattern:
#   imguizmo_set_option(BUILD_EXAMPLE_<NAME> OFF BOOL "ON to build the <name> example")
#
# Add new examples here and group them logically: Generic, Apple, GLFW, GLUT,
# SDL2, SDL3, Win32, etc.
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Add Examples Subdirectories
#--------------------------------------------------------------------

##############################
## Generic / Misc examples
##############################
imguizmo_set_option(BUILD_EXAMPLE_NULL OFF BOOL "ON to build the null example")
imguizmo_set_option(BUILD_EXAMPLE_ALLEGRO5 OFF BOOL "ON to build the allegro5 example")
imguizmo_set_option(BUILD_EXAMPLE_ANDROID_OPENGL3 OFF BOOL "ON to build the android opengl3 example")

if(BUILD_EXAMPLE_NULL)
    add_subdirectory(example_null)
endif()

if(BUILD_EXAMPLE_ALLEGRO5)
    add_subdirectory(example_allegro5)
endif()

if(BUILD_EXAMPLE_ANDROID_OPENGL3)
    add_subdirectory(example_android_opengl3)
endif()

##############################
## GLUT examples
##############################
imguizmo_set_option(BUILD_EXAMPLE_GLUT_OPENGL2 OFF BOOL "ON to build the glut opengl2 example")

if(BUILD_EXAMPLE_GLUT_OPENGL2)
    add_subdirectory(example_glut_opengl2)
endif()

##############################
## Apple examples
##############################
imguizmo_set_option(BUILD_EXAMPLE_APPLE_METAL OFF BOOL "ON to build the apple metal example")
imguizmo_set_option(BUILD_EXAMPLE_APPLE_OPENGL2 OFF BOOL "ON to build the apple opengl2 example")

if(BUILD_EXAMPLE_APPLE_METAL)
    add_subdirectory(example_apple_metal)
endif()

if(BUILD_EXAMPLE_APPLE_OPENGL2)
    add_subdirectory(example_apple_opengl2)
endif()

##############################
## GLFW examples
##############################
imguizmo_set_option(BUILD_EXAMPLE_GLFW_OPENGL2 OFF BOOL "ON to build the glfw opengl2 example")
imguizmo_set_option(BUILD_EXAMPLE_GLFW_OPENGL3 OFF BOOL "ON to build the glfw opengl3 example")
imguizmo_set_option(BUILD_EXAMPLE_GLFW_VULKAN OFF BOOL "ON to build the glfw vulkan example")
imguizmo_set_option(BUILD_EXAMPLE_GLFW_METAL OFF BOOL "ON to build the glfw metal example")
imguizmo_set_option(BUILD_EXAMPLE_GLFW_WGPU OFF BOOL "ON to build the glfw wgpu example")

if(BUILD_EXAMPLE_GLFW_OPENGL2)
    add_subdirectory(example_glfw_opengl2)
endif()

if(BUILD_EXAMPLE_GLFW_OPENGL3)
    add_subdirectory(example_glfw_opengl3)
endif()

if(BUILD_EXAMPLE_GLFW_VULKAN)
    add_subdirectory(example_glfw_vulkan)
endif()

if(BUILD_EXAMPLE_GLFW_METAL)
    add_subdirectory(example_glfw_metal)
endif()

if(BUILD_EXAMPLE_GLFW_WGPU)
    add_subdirectory(example_glfw_wgpu)
endif()

##############################
## SDL2 examples
##############################
imguizmo_set_option(BUILD_EXAMPLE_SDL2_OPENGL2 OFF BOOL "ON to build the sdl2 opengl2 example")
imguizmo_set_option(BUILD_EXAMPLE_SDL2_OPENGL3 OFF BOOL "ON to build the sdl2 opengl3 example")
imguizmo_set_option(BUILD_EXAMPLE_SDL2_METAL OFF BOOL "ON to build the sdl2 metal example")
imguizmo_set_option(BUILD_EXAMPLE_SDL2_VULKAN OFF BOOL "ON to build the sdl2 vulkan example")
imguizmo_set_option(BUILD_EXAMPLE_SDL2_DIRECTX11 OFF BOOL "ON to build the sdl2 directx11 example")
imguizmo_set_option(BUILD_EXAMPLE_SDL2_SDLRENDERER2 OFF BOOL "ON to build the sdl2 sdlrenderer2 example")
imguizmo_set_option(BUILD_EXAMPLE_SDL2_WGPU OFF BOOL "ON to build the sdl2 wgpu example")

if(BUILD_EXAMPLE_SDL2_OPENGL2)
    add_subdirectory(example_sdl2_opengl2)
endif()

if(BUILD_EXAMPLE_SDL2_OPENGL3)
    add_subdirectory(example_sdl2_opengl3)
endif()

if(BUILD_EXAMPLE_SDL2_METAL)
    add_subdirectory(example_sdl2_metal)
endif()

if(BUILD_EXAMPLE_SDL2_VULKAN)
    add_subdirectory(example_sdl2_vulkan)
endif()

if(BUILD_EXAMPLE_SDL2_DIRECTX11)
    add_subdirectory(example_sdl2_directx11)
endif()

if(BUILD_EXAMPLE_SDL2_SDLRENDERER2)
    add_subdirectory(example_sdl2_sdlrenderer2)
endif()

if(BUILD_EXAMPLE_SDL2_WGPU)
    add_subdirectory(example_sdl2_wgpu)
endif()

##############################
## SDL3 examples
##############################
imguizmo_set_option(BUILD_EXAMPLE_SDL3_OPENGL3 OFF BOOL "ON to build the sdl3 opengl3 example")
imguizmo_set_option(BUILD_EXAMPLE_SDL3_DIRECTX11 OFF BOOL "ON to build the sdl3 directx11 example")
imguizmo_set_option(BUILD_EXAMPLE_SDL3_METAL OFF BOOL "ON to build the sdl3 metal example")
imguizmo_set_option(BUILD_EXAMPLE_SDL3_SDLGPU3 OFF BOOL "ON to build the sdl3 sdlgpu3 example")
imguizmo_set_option(BUILD_EXAMPLE_SDL3_SDLRENDERER3 OFF BOOL "ON to build the sdl3 sdlrenderer3 example")
imguizmo_set_option(BUILD_EXAMPLE_SDL3_VULKAN OFF BOOL "ON to build the sdl3 vulkan example")
imguizmo_set_option(BUILD_EXAMPLE_SDL3_WGPU OFF BOOL "ON to build the sdl3 wgpu example")

if(BUILD_EXAMPLE_SDL3_OPENGL3)
    add_subdirectory(example_sdl3_opengl3)
endif()

if(BUILD_EXAMPLE_SDL3_DIRECTX11)
    add_subdirectory(example_sdl3_directx11)
endif()

if(BUILD_EXAMPLE_SDL3_METAL)
    add_subdirectory(example_sdl3_metal)
endif()

if(BUILD_EXAMPLE_SDL3_SDLGPU3)
    add_subdirectory(example_sdl3_sdlgpu3)
endif()

if(BUILD_EXAMPLE_SDL3_SDLRENDERER3)
    add_subdirectory(example_sdl3_sdlrenderer3)
endif()

if(BUILD_EXAMPLE_SDL3_VULKAN)
    add_subdirectory(example_sdl3_vulkan)
endif()

if(BUILD_EXAMPLE_SDL3_WGPU)
    add_subdirectory(example_sdl3_wgpu)
endif()

##############################
## Win32 examples
##############################
imguizmo_set_option(BUILD_EXAMPLE_WIN32_DIRECTX9 OFF BOOL "ON to build the win32 directx9 example")
imguizmo_set_option(BUILD_EXAMPLE_WIN32_DIRECTX10 OFF BOOL "ON to build the win32 directx10 example")
imguizmo_set_option(BUILD_EXAMPLE_WIN32_DIRECTX11 OFF BOOL "ON to build the win32 directx11 example")
imguizmo_set_option(BUILD_EXAMPLE_WIN32_DIRECTX12 OFF BOOL "ON to build the win32 directx12 example")
imguizmo_set_option(BUILD_EXAMPLE_WIN32_OPENGL3 OFF BOOL "ON to build the win32 opengl3 example")
imguizmo_set_option(BUILD_EXAMPLE_WIN32_VULKAN OFF BOOL "ON to build the win32 vulkan example")

if(BUILD_EXAMPLE_WIN32_DIRECTX9)
    add_subdirectory(example_win32_directx9)
endif()

if(BUILD_EXAMPLE_WIN32_DIRECTX10)
    add_subdirectory(example_win32_directx10)
endif()

if(BUILD_EXAMPLE_WIN32_DIRECTX11)
    add_subdirectory(example_win32_directx11)
endif()

if(BUILD_EXAMPLE_WIN32_DIRECTX12)
    add_subdirectory(example_win32_directx12)
endif()

if(BUILD_EXAMPLE_WIN32_OPENGL3)
    add_subdirectory(example_win32_opengl3)
endif()

if(BUILD_EXAMPLE_WIN32_VULKAN)
    add_subdirectory(example_win32_vulkan)
endif()
