# CMake Tutorials

## ___ Minimal Example ___
### Part 1/3 Create File "CMakeLists.txt"

``` cmake

cmake_minimum_required(VERSION 3.0)

# after project name there are multiple options
project(myproject LANGUAGES CXX)

# include subproject name "my_exe", where file "main.cpp" will be aďded
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

### Part 3/3 Bash Commands - Configure and Generate


Be sure to be in the folder where the file is "main.cpp" 

Create directory, before you start
```
mkdir build
```

Option 1 - Configure
```
cmake . 
```

Option 2 - Configure and Generate using default compiler
```
cmake .. 
```

Option 3 - Configure and Generate using Visual Studio compiler
https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html
https://cmake.org/cmake/help/latest/generator/Visual%20Studio%2017%202022.html
Other compilers: mingw, ninja
```
cmake -G "Visual Studio 16 2019" ..
```
 
Build the generated project e.g. in dir C:\Test\build
```
cmake --build .
```

Run the executable C:\Test\build\Debug
```
my_exe.exe
```

Remove folders and files, be one directory back, outside the folder
```
rmdir build /S /Q
```




#7
