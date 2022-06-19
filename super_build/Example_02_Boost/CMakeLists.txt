###############################################################################
#cmake + project name
###############################################################################
cmake_minimum_required(VERSION 3.10)
project(boostdemo)

###############################################################################
#create executable
###############################################################################
add_executable(boostdemo ${PROJECT_SOURCE_DIR}/main.cpp)

###############################################################################
#boost
###############################################################################
#https://github.com/BBO-repo/cpp-boost-cmake-superbuild
set( Boost_Bootstrap_Command ${CMAKE_BINARY_DIR}/boost-download/src/boost-external/bootstrap.sh && cp ${CMAKE_BINARY_DIR}/boost-download/src/boost-external-build/b2 ${CMAKE_BINARY_DIR}/boost-download/src/boost-external/)
set( Boost_b2_Command cd ${CMAKE_BINARY_DIR}/boost-download/src/boost-external && ./b2 )

include(ExternalProject)
ExternalProject_Add(
  boost-external #library name that will be used for linking in the executable
  GIT_REPOSITORY https://github.com/boostorg/boost.git
  GIT_TAG boost-1.79.0
  PREFIX boost-download
  CONFIGURE_COMMAND ${Boost_Bootstrap_Command}
  BUILD_COMMAND  ${Boost_b2_Command} install
    --without-python
    --without-mpi
    --disable-icu
    --prefix=${CMAKE_SOURCE_DIR}/thirdparty/boost/
    --threading=single,multi
    --link=shared
    --variant=release
    -j12
  INSTALL_COMMAND ""
)

set(Boost_LIBS ${CMAKE_SOURCE_DIR}/thirdparty/boost/lib/${CMAKE_STATIC_LIBRARY_PREFIX}boost_chrono${CMAKE_SHARED_LIBRARY_SUFFIX})
set(Boost_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/thirdparty/boost/include/)

###############################################################################
#link boost
###############################################################################

add_dependencies(boostdemo boost-external)
include_directories(boostdemo ${Boost_INCLUDE_DIR})
target_link_libraries(boostdemo ${Boost_LIBS})