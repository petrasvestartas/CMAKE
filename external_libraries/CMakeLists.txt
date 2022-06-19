################################################################################
#bash
#cmake  -DBUILD_SHARED_LIBS=ON -G "Visual Studio 17 2022" -A x64  ..  && cmake  --build . --config Release 
################################################################################
cmake_minimum_required(VERSION 3.21)

################################################################################
#SuperBuild
################################################################################
option (USE_SUPERBUILD "Whether or not a superbuild should be invoked" ON)

if (USE_SUPERBUILD)
  project (SUPERBUILD NONE)
  # execute the superbuild (this script will be invoked again without the
  # USE_SUPERBUILD option this time)
  include (cmake/SuperBuild.cmake)
  return()                      # stop processing this file further
else()
  project (Blah)                # <-- YOUR PROJECT NAME HERE
endif()

################################################################################
#My Project defaults
################################################################################

project(my_project)

if (MSVC)
 message("Petras is talking to you: MSVC Compiler, this line is not needed if MinGW compiler is used")
 #Without this message no .dll file is created, place ir after the project name
 set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
 #This one copies .dlls to project build directory
 set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
 set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
 set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
endif (MSVC)

set(CMAKE_VERBOSE_MAKEFILE OFF)
#add_subdirectory (src)


################################################################################
#My Project Linking
################################################################################
add_executable(my_exe "main.cpp")
add_dependencies(my_exe eigen)