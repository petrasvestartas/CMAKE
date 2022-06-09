project(print)

message("print library")

add_library(my_print_lib print.cpp)


message("CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}")
target_include_directories(my_print_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/print)
message("CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}")