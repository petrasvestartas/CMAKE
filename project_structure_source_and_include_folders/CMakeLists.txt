cmake_minimum_required(VERSION 3.0)
project(sortdemo)

#In these subdirectories add_library methods are created
add_subdirectory(src)
#Do not need to add "include" directory because include is linked in 
#src/sort/CMakeLists.txt target_include_directories(my_sort_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/sort)
#and src/print/CMakeLists.txt
#add_subdirectory(include)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE my_sort_lib my_print_lib)

