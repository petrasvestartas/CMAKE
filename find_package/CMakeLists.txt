cmake_minimum_required(VERSION 3.0)
project(use_sort)



find_package(sortdemo REQUIRED)

add_executable(example main.cpp)
target_link_libraries(example PRIVATE my_sort_lib my_print_lib)
