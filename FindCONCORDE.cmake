# This module locates the Concorde library and headers.
#
# User can give CONCORDE_ROOT_DIR as a hint stored in the cmake cache.
#
# It defines the following variables:
#   CONCORDE_FOUND         - True if the library and headers were found
#   CONCORDE_INCLUDE_DIR   - Directory containing concorde.h
#   CONCORDE_LIBRARY       - Path to the concorde_full library

message(STATUS "CONCORDE root dir: ${CONCORDE_ROOT_DIR}")

find_path(CONCORDE_INCLUDE_DIR
        NAMES concorde.h
        HINTS ${CONCORDE_ROOT_DIR}/build
        ${CONCORDE_ROOT_DIR}/build/include
        PATHS ENV C_INCLUDE_PATH
        ENV C_PLUS_INCLUDE_PATH
        ENV INCLUDE_PATH
)
message(STATUS "CONCORDE Include: ${CONCORDE_INCLUDE_DIR}")

find_library(CONCORDE_LIBRARY
        NAMES concorde_full
        HINTS ${CONCORDE_ROOT_DIR}/build
        ${CONCORDE_ROOT_DIR}/build/lib
        PATHS ENV LIBRARY_PATH
        ENV LD_LIBRARY_PATH
)
message(STATUS "CONCORDE Library: ${CONCORDE_LIBRARY}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CONCORDE
        REQUIRED_VARS CONCORDE_LIBRARY CONCORDE_INCLUDE_DIR
)

mark_as_advanced(CONCORDE_INCLUDE_DIR CONCORDE_LIBRARY)