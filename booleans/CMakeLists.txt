cmake_minimum_required(VERSION 3.0)
project(booleans)

#Example 1
set(USE_DEBUG_CODE TRUE)
#False
#set(USE_DEBUG_CODE 0)
#True
#set(USE_DEBUG_CODE 0.000)

if(USE_DEBUG_CODE)
 message("Example 1 True")
else()
 message("Example 1 False")
endif()

#Example 2
set(A FALSE)
set(B FALSE)

#if(A AND NOT B)
#if("")
if(NON_EXISTING_VARIABLE)
 message("Example 2 True")
else()
 message("Example 2 False")
endif()

#Example 3
#https://cmake.org/cmake/help/latest/command/find_package.html
find_package(Filesystem)
message("Filesystem_FOUND=${Filesystem_FOUND} Filesystem_DIR=${Filesystem_DIR}")

#if(Filesystem_FOUND)
if(Filesystem_DIR)
 message("Package was found")
else()
 message("Package was not found")
endif()

#Example 4
if (MSVC)
    #add_compile_options sets the flag for targets (executables and libraries)
    add_compile_options(/Wall)
else()
    add_compile_options(-Wall)
endif()