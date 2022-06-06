cmake_minimum_required(VERSION 3.0)
project(options)

#file paths
set(CACHE_VAR "Initial value 2" CACHE STRING "Documentation string")
set(CACHE_VAR_FILE_PATH "C:/eigen/README.md" CACHE FILEPATH "Documentation CACHE_VAR_FILE_PATH")
set(CACHE_VAR_PATH "C:/" CACHE PATH "Documentation CACHE_VAR_PATH")

#Internal hides variable from the user interface
set(CACHE_VAR_INTERNAL "Whatever" CACHE INTERNAL "Documentation CACHE_VAR_INTERNAL")

#option keyword (boolean variable)
#Variable name, documentation string and default value ON/OFF
option(MY_OPTION "Help for MY_OPTION" OFF)

#option is the same as below
set(MY_OPTION2 OFF CACHE BOOL "Help for MY_OPTION")

#Check variables
if(NOT MY_OPTION)
if(MY_OPTION)