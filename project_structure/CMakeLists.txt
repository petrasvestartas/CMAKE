cmake_minimum_required(VERSION 3.0)
project(sortdemo)

#In these subdirectories add_library methods are created
add_subdirectory(sort)
add_subdirectory(print)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE my_sort_lib my_print_lib)

