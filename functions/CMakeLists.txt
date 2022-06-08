cmake_minimum_required(VERSION 3.0)
project(function)

add_library(math_lib math.cpp math.hpp)
#add_executable(my_exe main.cpp math.cpp)   

####################################################################################
#Example 1
####################################################################################
function(set_compiler_options lib_name)

    message("${CMAKE_CURRENT_FUNCTION} called with ${lib_name}")

    if(MSVC)
        target_compile_options(math_lib PRIVATE /Wall /WX)
    else()
        target_compile_options(math_lib PRIVATE -Wall -Werror)
    endif()
    
endfunction()

set_compiler_options(math_lib)

####################################################################################
#Example 2
####################################################################################
function(f1 A)   
    #Keyword "PARENT_SCOPE" allows to modify variable A like a reference
    set(A 5 PARENT_SCOPE)
endfunction()

function(f0 A B)   
    message("f0 A=${A} B=${B}")
    f1(A)
    message("f0 A=${A} B=${B}")
endfunction()

f0(1 2)

####################################################################################
#Example 3
####################################################################################
function(f mandatory1 mandatory2)
    message("mandatory1=${mandatory1} mandatory2=${mandatory2}")
    #count of variables
    message("ARGC=${ARGC}")
    #all variables including not mentioned ones
    message("ARGV=${ARGV}")
    #optional variables that are not mentioned in the function signature
    message("ARGN=${ARGN}")
    foreach(arg IN LISTS ARGN)
        message("arg=${arg}")
    endforeach()
    
endfunction()

f(1 2 optional1 optional2)

####################################################################################
#Example 4 - function that modifies values (major.minor.path) inside file Version
####################################################################################

include(semver.cmake)
read_sember(DEBUG_INFO FILE_NAME "VERSION" MV a b c d e)
message("CMAKE_CURRENT_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}")
message("VERSION=${VERSION}")