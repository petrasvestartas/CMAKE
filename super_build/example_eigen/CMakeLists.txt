########################################################################
# REFERENCES AND BASH COMMANDS
########################################################################

#https://github.com/hshikata/udivone/blob/daba4ea493189c9e0118328d5f863f6a9f3cbf2e/superbuild/CMakeLists.txt
#https://github.com/simogasp/eesepDependencies/blob/994c701d29b753eefbe5a39cad38e5f880a31786/CMakeLists.txt
#https://fuchsia.googlesource.com/cobalt/+/refs/tags/v0.1.3/CMakeLists.txt

# bash commands
# cmake -DGET_LIBS=ON -DBUILD_MY_PROJECTS=OFF  -DBUILD_SHARED_LIBS=ON -G "Visual Studio 17 2022" -A x64 .. && cmake --build . --config Release
# cmake -DGET_LIBS=OFF -DBUILD_MY_PROJECTS=ON  -DBUILD_SHARED_LIBS=ON -G "Visual Studio 17 2022" -A x64 .. && cmake --build . --config Release
# Release\my_exe


########################################################################
#PROJECT INTIALIZATION
########################################################################
project(superbuild LANGUAGES CXX)
cmake_minimum_required(VERSION 3.19)


set(CMAKE_BUILD_TYPE_INIT "Release")

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

########################################################################
# START SUPERBUILD
########################################################################

SET(GET_LIBS "" CACHE STRING "Set option to download dependencies")

cmake_policy(SET CMP0097 NEW)
include(ExternalProject)

set(LIB_DEBUG_SUFFIX "")
if (MSVC)
  set(LIB_DEBUG_SUFFIX "d")
endif ()

########################################################################
# EIGEN
########################################################################
SET(GET_LIBS "" CACHE STRING "Set option to download dependencies")
if (GET_LIBS)
  message(AUTHOR_WARNING "GET_LIBS_" ${GET_LIBS})
  ExternalProject_Add(eigen
    GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
    GIT_TAG 3.4.0
    CMAKE_ARGS
      -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
      -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
      -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/install/eigen #has not effect
    SOURCE_DIR   "${CMAKE_BINARY_DIR}/install/eigen" #install directory is in build/install/eigen
    BUILD_COMMAND "" #do not build
    INSTALL_COMMAND "" #do not install
  )

endif ()

###############################################################################
#EXECUTABLE THANK LINK HEADER ONLY DIRECTORY
###############################################################################
SET(BUILD_MY_PROJECTS "" CACHE STRING "Build Project")
if (BUILD_MY_PROJECTS)
  message(AUTHOR_WARNING "BUILD_MY_PROJECTS_" ${BUILD_MY_PROJECTS})
  add_executable(my_exe main.cpp)
  #include_directories("${CMAKE_BINARY_DIR}/install/eigen/") #add directory of the EIGEN header-only library 
  target_include_directories(my_exe PRIVATE "${CMAKE_BINARY_DIR}/install/eigen/") #add directory of the EIGEN header-only library 
endif ()
