project(print)

message("print library")

add_library(my_print_lib print.cpp)


#target_include_directories(my_print_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/print)

#Add generator expressions <>
target_include_directories(my_print_lib
    PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include/print>
    $<INSTALL_INTERFACE:include/print>
)


message("CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}")