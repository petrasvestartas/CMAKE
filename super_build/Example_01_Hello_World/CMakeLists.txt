cmake_minimum_required(VERSION 3.21)
project(recipe-01 LANGUAGES CXX)

###############################################################################
#C++ 14 Project
###############################################################################
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

###############################################################################
#set EP_BASE Directoy property
###############################################################################
set_property(DIRECTORY PROPERTY EP_BASE ${CMAKE_BINARY_DIR}/subprojects)

###############################################################################
#include ExternalProject.cmake
###############################################################################
include(ExternalProject)

###############################################################################
#Exe project is added as an external project
###############################################################################
ExternalProject_Add(
        ${PROJECT_NAME}_core #name
    SOURCE_DIR 
        ${CMAKE_CURRENT_LIST_DIR}/src #set the directory where the main.cpp and CMakeLists.txt are
    CMAKE_ARGS #C++ compiler and compiler flats for C++ standard 
        -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} 
        -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD} 
        -DCMAKE_CXX_EXTENSIONS=${CMAKE_CXX_EXTENSIONS} 
        -DCMAKE_CXX_STANDARD_REQUIRED=${CMAKE_CXX_STANDARD_REQUIRED}
    CMAKE_CACHE_ARGS #compiler flags
        -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
    BUILD_ALWAYS #the project must be built always
        1
    INSTALL_COMMAND #installer for now is empty
        ""



)
