project(sort)

message("sort library")

add_library(my_sort_lib sort.cpp)

message("CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}")
target_include_directories(my_sort_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/sort)
message("CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}")