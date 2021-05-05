#
# Find tinyobjloader
#
# Try to find tinyobjloader library.
# This module defines the following variables:
# - TINY_OBJ_LOADER_INCLUDE_DIRS
# - TINY_OBJ_LOADER_FOUND
#
# The following variables can be set as arguments for the module.
# - TINY_OBJ_LOADER_ROOT_DIR : Root library directory of tinyobjloader
#
# References:
# - https://github.com/lighttransport/nanogi/blob/master/cmake/FindGLFW.cmake
#

# Additional modules
include(FindPackageHandleStandardArgs)

if (WIN32)
	# Find include files
	find_path(
		TINY_OBJ_LOADER_INCLUDE_DIR
		NAMES tiny_obj_loader.h
		PATHS
		$ENV{PROGRAMFILES}/include
		${TINY_OBJ_LOADER_ROOT_DIR}/
		DOC "The directory where tiny_obj_loader.h resides")
else()
	# Find include files
	find_path(
		TINY_OBJ_LOADER_INCLUDE_DIR
		NAMES tiny_obj_loader.h
		PATHS
		/usr/include
		/usr/local/include
		/sw/include
		/opt/local/include
		DOC "The directory where tiny_obj_loader.h resides")
endif()

# Handle REQUIRD argument, define *_FOUND variable
find_package_handle_standard_args(tinyobjloader DEFAULT_MSG TINY_OBJ_LOADER_INCLUDE_DIR)

# Define TINY_OBJ_LOADER_INCLUDE_DIRS
if (tinyobjloader_FOUND)
	set(TINY_OBJ_LOADER_INCLUDE_DIRS ${TINY_OBJ_LOADER_INCLUDE_DIR})
endif()

# Hide some variables
mark_as_advanced(TINY_OBJ_LOADER_INCLUDE_DIR)
