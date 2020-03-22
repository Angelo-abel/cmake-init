
# gmock_FOUND
# gmock-dev
# gmock
# GMOCK_TARGET
# GMOCK_SOURCE_DIR
# GMOCK_INCLUDE_DIRS

include(FindPackageHandleStandardArgs)

find_path(GMOCK_SOURCE_DIR googlemock/CMakeLists.txt

    PATHS
    $ENV{GMOCK_DIR}
    /usr/src/googletest
    /usr/local/src/googletest
    /opt/local/src/googletest

    DOC "The directory where googlemock/CMakeLists.txt resides")

find_package_handle_standard_args(gmock REQUIRED_VARS GMOCK_SOURCE_DIR)

add_subdirectory(${GMOCK_SOURCE_DIR}/googlemock ${CMAKE_CURRENT_BINARY_DIR}/googletest EXCLUDE_FROM_ALL)

# Create interface library to link against gmock
add_library(gmock-dev INTERFACE)

target_include_directories(gmock-dev
    SYSTEM INTERFACE
    ${GMOCK_SOURCE_DIR}/googletest/include
    ${GMOCK_SOURCE_DIR}/googlemock/include
)

target_link_libraries(gmock-dev
    INTERFACE
    gmock
)

set(GMOCK_TARGET gmock-dev)
set(GMOCK_INCLUDE_DIRS ${GMOCK_SOURCE_DIR}/googletest/include
    ${GMOCK_SOURCE_DIR}/googlemock/include)
set(GMOCK_INCLUDE_DIR gmock-dev)

mark_as_advanced(GMOCK_TARGET GMOCK_SOURCE_DIR GMOCK_INCLUDE_DIRS)
