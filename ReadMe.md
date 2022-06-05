# CMake Tutorials

* [minimal_example](#minimal_example)
* [libraries](#libraries)



___

<a name="minimal_example"></a>

### :one: minimal_example 
#### Part 1/3 Create CMake File "CMakeLists.txt"

``` cmake

cmake_minimum_required(VERSION 3.0)

# this is the whole project name, after name there are multiple options
project(myproject LANGUAGES CXX)

# include subproject in project "myproject" named "my_exe", where file "main.cpp" will be aďded
# header files are referenced automatically, but you need to include source files
add_executable(my_exe main.cpp math.cpp)

# print a message
message("Hello World from CMakeLists!")


```

#### Part 2/3 Create C++ Files "main.cpp math.hpp math.cpp"

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

#### Part 3/3 Run Bash Commands: Configure -> Generate -> Build -> Run


Be sure to be in the folder where the files are "CMakeLists.txt" and "main.cpp" 

Create directory, before you start
```
mkdir build
cd build
```


Option 1 - Configure and Generate using default compiler 
two dots means you are in build folder and CMakeLists.txt is in the previous one including source files
one dot means that CMakeLists.txt and source files are in build folder
```
cmake .. 
```

Option 2 - Configure and Generate using Visual Studio compiler
* https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html
* https://cmake.org/cmake/help/latest/generator/Visual%20Studio%2017%202022.html
* Other compilers: mingw, ninja
```
cmake -G "Visual Studio 16 2019" ..
```
 
Build the generated project e.g. in dir C:\Test\build
```
cmake --build .
```

Run the executable C:\Test\build\Debug
```
Debug\my_exe
```

Remove folders and files, be one directory back, outside the folder
```
rmdir build /S /Q
```

___

<a name="libraries"></a>
### :two: libraries

there are two steps - creating library and linking library:
* add_library(LIBRARY_NAME STATIC/SHARED/OBJECT source1.cpp source2.cpp)
* target_link_libraries(my_exe PUBLIC math_lib)

* by default - static library
* cmake -DBUILD_SHARED_LIBS=ON changes defaults


#### Part 1/3 Create CMake File "CMakeLists.txt"
``` cmake

cmake_minimum_required(VERSION 3.0)
project(myproject LANGUAGES CXX)

add_library(math_lib math.cpp)

add_executable(my_exe main.cpp math.cpp)
add_executable(my_exe_2 main_2.cpp math.cpp)
```

#### Part 2/3 Create C++ Files "main.cpp"

main.cpp
``` cpp
code
```

#### Part 3/3 Run Bash Commands: Configure -> Generate -> Build -> Run
What
```
code
```


