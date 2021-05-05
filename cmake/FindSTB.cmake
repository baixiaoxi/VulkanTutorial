#
# Find stb
#
# Try to find stb library.
# This module defines the following variables:
# - STB_INCLUDE_DIRS
# - STB_FOUND
#
# The following variables can be set as arguments for the module.
# - STB_ROOT_DIR : Root library directory of stb
#
# References:
# - https://github.com/lighttransport/nanogi/blob/master/cmake/FindGLFW.cmake
#

# Additional modules
include(FindPackageHandleStandardArgs)

if (WIN32)
	# Find include files
	find_path(
		STB_INCLUDE_DIR
		NAMES stb_image.h
		PATHS
		$ENV{PROGRAMFILES}/include
		${STB_ROOT_DIR}/
		DOC "The directory where stb_image.h resides")
else()
	# Find include files
	find_path(
		STB_INCLUDE_DIR
		NAMES stb_image.h
		PATHS
		/usr/include
		/usr/local/include
		/sw/include
		/opt/local/include
		DOC "The directory where stb_image.h resides")
endif()

# Handle REQUIRD argument, define *_FOUND variable
find_package_handle_standard_args(stb DEFAULT_MSG STB_INCLUDE_DIR)

# Define STB_INCLUDE_DIRS
if (STB_FOUND)
	set(STB_INCLUDE_DIRS ${STB_INCLUDE_DIR})
endif()

# Hide some variables
mark_as_advanced(STB_INCLUDE_DIR)
