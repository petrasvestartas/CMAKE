cmake_minimum_required(VERSION 3.0)
project(myproject LANGUAGES CXX)

# library name, library type STATIC / SHARED, and source files
add_library(math_lib STATIC math.cpp)

# you do not need to specify math.cpp files anymore, since they are in math_lib
add_executable(my_exe main.cpp)
add_executable(my_exe_2 main_2.cpp)

# link executables to the library, with a PUBLIC / PRIVATE / INTERFACE keyword
# there can be more than one library e.g. target_link_libraries(my_exe PUBLIC math_lib other_library_1 other_library_2)
target_link_libraries(my_exe PUBLIC math_lib)
target_link_libraries(my_exe_2 PUBLIC math_lib)