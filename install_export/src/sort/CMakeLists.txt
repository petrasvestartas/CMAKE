project(sort)
message("sort library")
add_library(my_sort_lib sort.cpp)

#target_include_directories(my_sort_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/sort)
#$<..> Generator expresions:
#these are two different paths for building and installation
target_include_directories(my_sort_lib 
PUBLIC 
$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include/sort>
$<INSTALL_INTERFACE:include/sort>
)

message("CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}")