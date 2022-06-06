cmake_minimum_required(VERSION 3.0)
project(lists)

#https://cmake.org/cmake/help/latest/command/list.html
#List is defined my "MY_LIST" keyword, but not be within " "
#In CMake lists are separated by ";" even within " "
set(MY_LIST a b c d eee fff g)
message("MY_LIST: ${MY_LIST}")

#list length
list(LENGTH MY_LIST MY_LIST_LENGTH)
message("MY_LIST_LENGTH: ${MY_LIST_LENGTH}")

#list get
list(GET MY_LIST 2 MY_LIST_GET)
message("MY_LIST_GET: ${MY_LIST_GET}")

#list join concatenate all elements with a separator    
list(JOIN MY_LIST "+" MY_LIST_JOIN)
message("MY_LIST_JOIN: ${MY_LIST_JOIN}")

#list join concatenate all elements with a separator    
list(APPEND MY_LIST PETRAS VESTARTAS)
message("MY_LIST: ${MY_LIST}")
