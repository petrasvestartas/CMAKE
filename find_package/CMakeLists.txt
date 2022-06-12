cmake_minimum_required(VERSION 3.0)
project(use_sort)

message(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
message(CMAKE_RUNTIME_OUTPUT_DIRECTORY)





find_package(sortdemo REQUIRED)

add_executable(example main.cpp)
target_link_libraries(example PRIVATE my_sort_lib my_print_lib)

message(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
