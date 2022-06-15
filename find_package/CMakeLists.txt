cmake_minimum_required(VERSION 3.0)
project(use_sort)
#Incase CMake path is not found:
#set(CMAKE_PREFIX_PATH "${CMAKE_PREFICES_PATH};C:\Program Files\sortdemo") #confi mode
#set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};C:\Program Files\sortdemo") #confi mode


if (MSVC)
 message("Petras is talking to you: MSVC Compiler, this line is not needed if MinGW compiler is used")
 #Without this message no .dll file is created, place ir after the project name
 set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

 #This one copies .dlls to project build directory
 set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
 message(CMAKE_RUNTIME_OUTPUT_DIRECTORY)

endif (MSVC)


find_package(sortdemo REQUIRED)
add_executable(example main.cpp)
target_link_libraries(example PRIVATE sortdemo::my_sort_lib sortdemo::my_print_lib)
