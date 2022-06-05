# CMake Tutorials

## ___ Minimal Example ___
### Part 1/3 Create File "CMakeLists.txt"

``` cmake

cmake_minimum_required(VERSION 3.0)

# after project name there are multiple options
project(myproject LANGUAGES CXX)

# INCLUDE SUBPROJECT NAME "mainExec", WHERE FILE "main.cpp" WILL BE PLACED
# header files are referenced automatically, but you need to include source files
add_executable(my_exe main.cpp math.cpp)

#INCLUDE SUB-PROJECTS - NOT SURE WHAT THIS MEANS
add_subdirectory ("CMakeProject1")

# print a message
message("Hello World!")


```

### Part 2/3 Create File "main.cpp math.hpp math.cpp"

main.cpp
``` cpp
#include <iostream>
#include "math.hpp"

int main(int argc, char **argv){
 std::cout << "Hi \n";
 std::cout << "Call sum function from header: " << sum(2,3) << "\n";
 return 0;
}

```

math.hpp
``` hpp
#pragma once
int sum(int a, int b);
```

math.cpp
``` cpp
#include "math.hpp"
int sum(int a, int b){
 return a+b;
}
```

### Part 3/3 Bash Commands
``` bash

# CREATE FOLDER
	• mkdir name
REMOVE FOLDERS AND FILES, BEFORE YOU MUST GO BACK TO PREVIOUS FOLDER
	• rmdir build /S /Q

CONFIGURE AND GENERATE PROJECT
BE SURE TO BE IN THE FOLDER WHERE THE FILE IS "main.cpp" 
YOU MUST CREATE "build" FOLDER BEFORE 
YOU CAN SPECIFIC DEFAULT COMPILER BY ".." OR SELECT A SPECIFIC COMPILER (-G Generator ) 
LINKS:
https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html
https://cmake.org/cmake/help/latest/generator/Visual%20Studio%2017%202022.html
	• mkdir build
THEN
	• cmake . (Configure )
	• cmake .. (Configure and Generate)
	• cmake -G "CompilerName e.g. Visual Studio 16 2019" ..
 
BUILD THE FULL SOLUTION GENERATED BY CMAKE IN C:\Test\build
	• cmake --build .

RUN THE EXCUTABLE IN C:\Test\build\Debug
	• mainExec.exe

IF YOU DO NOT WANT TO USE VISUAL STUDIO COMPILER YOU CAN RUN "MINGW" 


```

#7
