################################################################################
#Project name and defaults
################################################################################
cmake_minimum_required(VERSION 3.21)
project(fetch_project_name)

if (MSVC)
 message("Petras is talking to you: MSVC Compiler, this line is not needed if MinGW compiler is used")
 #Without this message no .dll file is created, place ir after the project name
 set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

 #This one copies .dlls to project build directory
 set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
 message(CMAKE_RUNTIME_OUTPUT_DIRECTORY)

endif (MSVC)

set(CMAKE_VERBOSE_MAKEFILE ON)

################################################################################
#Create Library
################################################################################
add_library(math_lib math.cpp math.hpp)

#find_library(ABC_PATH abc HINTS ${CMAKE_CURRENT_SOURCE_DIR})
#find_path(GLIB_INLCUDE_PATHS glib.h HINTS /usr/include /usr/local/include PATH_SUFFIXES glib-2.0)
#find_package(Threads REQUIRED)
#target_link_libraries(name PRIVATE Threads::Threads)

################################################################################
#GoogleTest
################################################################################
include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG  release-1.11.0
)

# Check if population has already been performed
FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
    message(STATUS "Failed to fetch googletest")
    # Fetch the content using previously declared details
    FetchContent_Populate(googletest)
    # Bring the populated content into the build
    add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
else()
    message(STATUS "googletest already populated")
endif()

################################################################################
#Create executables and link libraries
################################################################################
#this is a google test run from bash Debug\test_0
add_executable(test_0 main.cpp)
target_link_libraries(test_0 PRIVATE math_lib gtest_main gmock_main)

#this is a ctest
#add_executable(test_1 main_2.cpp)
#target_link_libraries(test_1 PRIVATE math_lib gtest_main gmock_main)

#enable_testing()
#add_test(test_1 test_1)
#add_test(NAME unit_test_1 COMMAND test_1)