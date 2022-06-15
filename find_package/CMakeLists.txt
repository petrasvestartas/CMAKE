cmake_minimum_required(VERSION 3.21)
project(use_sort)
#Incase CMake path is not found:
#set(CMAKE_PREFIX_PATH "${CMAKE_PREFICES_PATH};C:\Program Files\sortdemo") #confi mode
#set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};C:\Program Files\sortdemo") #confi mode


find_package(sortdemo REQUIRED)
add_executable(example main.cpp)
target_link_libraries(example PRIVATE sortdemo::my_sort_lib sortdemo::my_print_lib)




include(GNUInstallDirs )
install(
    TARGETS "example" 
    RUNTIME_DEPENDENCIES 
    )
