# CMake Tutorials

## 1 Create Simple Project
### Part 1/3 Create File "CMakeLists.txt"
``` cmake

cmake_minimum_required(VERSION 3.0)

project(myproject LANGUAGES CXX)

add_executable(my_exe main.cpp)

```

### Part 2/3 Create File "main.cpp"

``` cpp
#include <iostream>

int main(int argc, char **argv){
 std::cout << "Hi \n";
 return 0;
}

```
### Part 3/3 Bash Commands
``` bash
cd

```
