cmake_minimum_required(VERSION 3.0)

include(CMakeParseArguments)

project(vulkanTutorial)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_MACOSX_RPATH OFF)
set(CMAKE_THREAD_PREFER_PTHREAD ON)
set(THREADS_PREFER_PTHREAD_FLAG ON) 

set(PROJECT_VERSION_MAJOR 0)
set(PROJECT_VERSION_MINOR 0)
set(PROJECT_VERSION_PATCH 1)

#######################################################################
## External libraries
##
## Module path, prefix, architecture, build type
##

# Add module path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# GLM
set(GLM_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/samples/third_party/glm")
find_package(GLM REQUIRED)
#include_directories(${GLM_INCLUDE_DIRS})

# vulkan
find_package(Vulkan REQUIRED)
include_directories(${Vulkan_INCLUDE_DIRS})

# stb
set(STB_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/samples/third_party/stb")
find_package(stb REQUIRED)
#include_directories(${STB_INCLUDE_DIRS})

# tinyobjloader
set(TINY_OBJ_LOADER_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/samples/third_party/tinyobjloader")
find_package(tinyobjloader REQUIRED)
#include_directories(${TINY_OBJ_LOADER_INCLUDE_DIRS})

add_subdirectory(samples/third_party)

# glfw
#option(GLFW_USE_STATIC_LIBS "GLFW_USE_STATIC_LIBS" ON)
set(GLFW_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/samples/third_party/glfw")
find_package(GLFW REQUIRED)

# add subproject
add_subdirectory(samples/chapter0)
add_subdirectory(samples/chapter1)
add_subdirectory(samples/chapter2)
add_subdirectory(samples/chapter3)
add_subdirectory(samples/chapter4)
add_subdirectory(samples/chapter5)
add_subdirectory(samples/chapter6)
add_subdirectory(samples/chapter7)
add_subdirectory(samples/chapter8)
add_subdirectory(samples/chapter9)
add_subdirectory(samples/chapter10)
add_subdirectory(samples/chapter11)
add_subdirectory(samples/chapter12)
add_subdirectory(samples/chapter13)
add_subdirectory(samples/chapter14)
add_subdirectory(samples/chapter15)
add_subdirectory(samples/chapter16)
add_subdirectory(samples/chapter17)
add_subdirectory(samples/chapter18)
add_subdirectory(samples/chapter19)
add_subdirectory(samples/chapter20)
add_subdirectory(samples/chapter21)
add_subdirectory(samples/chapter22)
add_subdirectory(samples/chapter23)
add_subdirectory(samples/chapter24)
add_subdirectory(samples/chapter25)
add_subdirectory(samples/chapter26)
add_subdirectory(samples/chapter27)
add_subdirectory(samples/chapter28)
add_subdirectory(samples/chapter29)
# --------------------------------------------------------------------------------

if (MSVC)
	# Set prefix path according to generator
	# Currently only VC16 is supported
	if (CMAKE_GENERATOR STREQUAL "Visual Studio 16 2019")
		set(GENERATOR_PREFIX "vc16")
	else()
		message(FATAL_ERROR "Invalid generator")
	endif()
	list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/external")
	list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/external/${GENERATOR_PREFIX}")
endif()

# Set architecture
if (CMAKE_CL_64)
	set(CMAKE_LIBRARY_ARCHITECTURE "x64")
else()
	set(CMAKE_LIBRARY_ARCHITECTURE "i386")
endif()
# --------------------------------------------------------------------------------
##
## Compiler options
##

if (MSVC)
	# Ignore linker warnings in VS
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /ignore:4099")
	add_definitions(-D_SCL_SECURE_NO_WARNINGS)

	# Increase stack size to 10MB
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /STACK:10000000")

	# Warning level 4, treat warning as errors
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")

	# Add floating-point flag
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /fp:strict")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHa")

    # Platform flag (used in boost)
    # cf. http://stackoverflow.com/questions/9742003/platform-detection-in-cmake
    set(_VERSION ${CMAKE_SYSTEM_VERSION})
    string(REPLACE "." "" _VERSION ${_VERSION})
    string(REGEX REPLACE "([0-9])" "0\\1" _VERSION ${_VERSION})
    add_definitions(-D_WIN32_WINNT=0x${_VERSION})
endif()

if (CMAKE_COMPILER_IS_GNUCXX)
	# Enabling C++17 for gcc
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")

	# If the build type is Debug, define macro
	if (CMAKE_BUILD_TYPE STREQUAL Debug)
		add_definitions(-D_DEBUG)
	endif()

	# Enable all warnings, treat warning as errors
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")

	# Ignore unknown pragma
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unknown-pragmas")

        # Suppress warning on boost https://svn.boost.org/trac/boost/ticket/8546
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-local-typedef")
endif()

if (CMAKE_CXX_COMPILER_ID MATCHES Clang)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -stdlib=libc++")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unknown-pragmas")
        # Suppress warning on boost https://svn.boost.org/trac/boost/ticket/8546
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-local-typedef")
endif()

# --------------------------------------------------------------------------------

##
## Output directories
##
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

# --------------------------------------------------------------------------------


# Specify to use solution directories
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# --------------------------------------------------------------------------------

##
## Sync resource
##

#message(FATAL_ERROR "${Vulkan_INCLUDE_DIRS}--#${GLFW_INCLUDE_DIRS}")



# --------------------------------------------------------------------------------