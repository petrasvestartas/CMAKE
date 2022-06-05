cmake_minimum_required(VERSION 3.0)

# this is the whole project name, after name there are multiple options
project(myproject LANGUAGES CXX)

# include subproject in project "myproject" named "my_exe", where file "main.cpp" will be aďded
# header files are referenced automatically, but you need to include source files
add_executable(my_exe main.cpp math.cpp)

# print a message
message("Hello World from CMakeLists!")