# CMake Tutorials

## 1 Minimal Example
### Part 1/3 Create File "CMakeLists.txt"

``` cmake

cmake_minimum_required(VERSION 3.0)

project(myproject LANGUAGES CXX)

add_executable(my_exe main.cpp math.cpp)

```

### Part 2/3 Create File "main.cpp math.hpp math.cpp"

``` cpp
#include <iostream>
#include "math.hpp"

int main(int argc, char **argv){
 std::cout << "Hi \n";
 std::cout << "Call sum function from header: " << sum(2,3) << "\n";
 return 0;
}

```

``` hpp
#pragma once
int sum(int a, int b);
```

``` cpp
#include "math.hpp"
int sum(int a, int b){
 return a+b;
}
```

### Part 3/3 Bash Commands
``` bash
cd

```
