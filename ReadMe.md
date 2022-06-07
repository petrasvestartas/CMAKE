___

### CMake Tutorials

Examples:

* [minimal_example](#minimal_example)
* [libraries](#libraries)
* [project_structure](#project_structure)
* [project_structure_source_and_include_folders](#project_structure_source_and_include_folders)

Syntax:

* [variables](#variables)
* [cache_variables](#cache_variables)
* [options](#options)
* [lists](#lists)
* [numeric_values](#numeric_values)
* [booleans](#booleans)
* [loops](#loops)

___

<a name="minimal_example"></a>

### :one: :recycle: minimal_example

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

* <https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html>
* <https://cmake.org/cmake/help/latest/generator/Visual%20Studio%2017%202022.html>
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

### :two: :recycle: libraries  

there are two steps - creating library and linking project to the library, if library keyowrd is omitted by default STATIC library is built:

``` cmake
add_library(LIBRARY_NAME STATIC/SHARED/OBJECT source1.cpp source2.cpp)
target_link_libraries(my_exe PUBLIC math_lib)
```

#### Part 1/3 Create CMake File "CMakeLists.txt"

``` cmake

cmake_minimum_required(VERSION 3.0)
project(myproject LANGUAGES CXX)

# only for windows
# https://stackoverflow.com/questions/40739061/error-lnk1104-cannot-open-file-debug-myprojectlib-lib/40743080#40743080
if (MSVC)
 message("Petras is talking to you: MSVC Compiler, this line is not needed if MinGW compiler is used")
 set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
endif (MSVC)

# library name, library type STATIC / SHARED, and source files
add_library(math_lib math.cpp math.hpp)

# you do not need to specify math.cpp files anymore, since they are in math_lib
add_executable(my_exe main.cpp)
add_executable(my_exe_2 main_2.cpp)

# link executables to the library, with a PUBLIC / PRIVATE / INTERFACE keyword
# there can be more than one library e.g. target_link_libraries(my_exe PUBLIC math_lib other_library_1 other_library_2)
target_link_libraries(my_exe PUBLIC math_lib)
target_link_libraries(my_exe_2 PUBLIC math_lib)
```

#### Part 2/3 Create C++ Files "main.cpp main_2.cpp math.hpp math.cpp"

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

main_2.cpp

``` cpp
#include <iostream>
#include "math.hpp"

int main(int argc, char **argv){
 std::cout << "main_2 \n";
 std::cout << "Call sum function from header: " << sum(1,1) << "\n";
 return 0;
}
```

math.hpp

``` cpp
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

Bash

```
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=ON -G "Visual Studio 16 2019" ..
cmake --build .
Debug\my_exe
Debug\my_exe_2 
```

___

<a name="variables"></a>

### :three: variables

All vaiables in CMake are strings
For syntax testing .cmake file is created

examples:

* A run cmake file string_example.cmake
* B run CMakeLists.txt

#### Part A 1/2 CMake files

``` cmake

#message
message("Hello World!")

#create and set variables
set(FOO "Foo Value")

#get values
message("${FOO}")

#Variable concatenation 
#Example using "." symbol, by default concatenation is made using ";"
set(MY_PROJECT_MAJOR "1")
set(MY_PROJECT_MINOR "2")
set(MY_PROJECT_PATCH "3")
set(MY_PROJECT_VERSION  ${MY_PROJECT_MAJOR} ${MY_PROJECT_MINOR} ${MY_PROJECT_PATCH} )
message("${MY_PROJECT_VERSION}")
set(MY_PROJECT_VERSION "${MY_PROJECT_MAJOR}.${MY_PROJECT_MINOR}.${MY_PROJECT_PATCH}")
message("${MY_PROJECT_VERSION}")

#Manipulation of strings
set(PLATFORM "WINDOWS")
set(HELLO_MESSAGE_WINDOWS "Hello W-I-N-D-O-W-S OS")
set(HELLO_MESSAGE_UNIX "Hello U-N-I-X OS")
message("HELLO_MESSAGE_${PLATFORM} = ${HELLO_MESSAGE_${PLATFORM}}")

#Multi-line format using "[[" and "]]"
set(HELLO_MESSAGE [[
echo "Hello
World!
]])
message("${HELLO_MESSAGE}")
```

#### Part A 2/2 Run Bash Commands

bash

``` bash
cmake -P string_example.cmake
```

#### Part B 1/2 CMakeList strings

CMakeLists

``` cmake
cmake_minimum_required(VERSION 3.0)
project(strings_example)

#string documentation
#https://cmake.org/cmake/help/latest/command/string.html

#stores the first positions at which the string is found e.g. -1, 0 or 3
string(FIND "abcdefgh" "def" FIND_RESULT REVERSE)
message("FIND_RESULT: ${FIND_RESULT}")

#replace the first instance of the string with the second
string(REPLACE "abc" "ABC" REPLACE_RESULT "abcdefgh")
message("REPLACE_RESULT: ${REPLACE_RESULT}")

#append to string
set(APPEND_INPUT "Append something to me ")
string(APPEND APPEND_INPUT "Petras")
message("APPEND_INPUT: ${APPEND_INPUT}")

#to lower case
string(TOLOWER ${APPEND_INPUT} TOLOWER_RESULT)
message("TOLOWER_RESULT: ${TOLOWER_RESULT}")
```

#### Part B 1/2 CMakeList bash

bash

``` bash
cmake ..
```

___

<a name="cache_variables"></a>

### :four: variables

#### Part 1/2 CMakeLists.txt file

CMakeLists Cache variables are kept in memory after the last generation

``` cmake
cmake_minimum_required(VERSION 3.0)
project(cache_example)

#Normal variable is empty if the CMakeLists is called twice
message("NON_CACHE_VAR = ${NON_CACHE_VAR}")
set(NON_CACHE_VAR "Initial value")
message("NON_CACHE_VAR = ${NON_CACHE_VAR}")

#Cache variables stays within multiple calls to cmake
#FORCE keyword does not allow user to change this value
message("CACHE_VAR = ${CACHE_VAR}")
set(CACHE_VAR "Initial value 2" CACHE STRING "Help me with this cache variable" FORCE)
message("CACHE_VAR = ${CACHE_VAR}")

#To modify variables use -D Keyword " "cmake -DCACHE_VAR=set_by_Petras .. "
```

#### Part 2/2 Run Bash Commands

Change variable using bash (no spaces)

``` bash
mkdir build
cd build
cmake ..
cmake -DCACHE_VAR=set_by_Petras ..
```

___

<a name="options"></a>

### :five: options

#### Part 1/2 CMakeLists.txt file

Setting boolean value using "option" keyword
Set File and FilePaths
Declare internal variables not visible to the user

``` cmake
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

```

#### Part 2/2 Run Bash Commands

bash

``` bash
mkdir build
cd build
cmake ..
```

gui in the folder where the cache is

``` bash
cmake-gui .
```

___

<a name="lists"></a>

### :six: lists

#### Part 1/2 CMakeLists.txt file

``` cmake
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

```

#### Part 2/2 Run Bash Commands

bash

``` bash
cmake ..
```

___

<a name="numeric_values"></a>

### :seven: numeric_values

#### Part 1/2 CMakeLists.txt file

``` cmake
cmake_minimum_required(VERSION 3.0)
project(numeric_values)


set (x "1")
set (y 3)
set (z "4")

#(x+y)*z
math(EXPR result "(${x}+${y})*${z}")
message("result: ${result}")

```

#### Part 2/2 Run Bash Commands

bash

``` bash
cmake ..
```

___

<a name="booleans"></a>

### :eight: booleans

Syntax:

```
if(expression)
...
elsif(expression2)
...
else()
...
endif()
```

What is True or False?

* True - YES, Y, TRUE, ON, Numberic values not equalt to 0, Everything else
* False - NO, N, FALSE, OFF, Zero, IGNORE, NOTFOUND, xxx-NOTFOUND, some_library-NOTFOUND, "", 0

Logical Operators

* AND
* OR
* NOT

``` cmake
option(USE_NETWORKING "Documentation", OFF)
option(CUSTOM_LOGGER, "Documentation", ON)

if(USE_NETWORKING AND NOT CUSTOM_LOGGER)
 #do something
endif()
```

Comparisons

* Numeric values: GREATER, GREATER_EQUAL, EQUAL, LESS, LESS_EQUAL
* Versions (ex. 1.2.0): VERSION_GREATER, VERSION_GREATER_EQUAL, VERSION_EQUAL, VERSION_LESS, VERSION_LESS_EQUAL
* Strings: STRGREATER, STRGREATER_EQUAL, STREQUAL, STRLESS, STRLESS_EQUAL

``` cmake
set(A 2)

if(A GREATER 1)
 #do something
endif()


set(MY_STRING "AAA")
set(MY_REGEX "A")

if(MY_STRING MATCHES MY_REGEX)
 #do something
endif()
```

#### Part 1/2 CMakeLists.txt file

```cmake
cmake_minimum_required(VERSION 3.0)
project(booleans)

#Example 1
set(USE_DEBUG_CODE TRUE)
#False
#set(USE_DEBUG_CODE 0)
#True
#set(USE_DEBUG_CODE 0.000)

if(USE_DEBUG_CODE)
 message("Example 1 True")
else()
 message("Example 1 False")
endif()

#Example 2
set(A FALSE)
set(B FALSE)

#if(A AND NOT B)
#if("")
if(NON_EXISTING_VARIABLE)
 message("Example 2 True")
else()
 message("Example 2 False")
endif()

#Example 3
#https://cmake.org/cmake/help/latest/command/find_package.html
find_package(Filesystem)
message("Filesystem_FOUND=${Filesystem_FOUND} Filesystem_DIR=${Filesystem_DIR}")

#if(Filesystem_FOUND)
if(Filesystem_DIR)
 message("Package was found")
else()
 message("Package was not found")
endif()

#Example 4
if (MSVC)
    #add_compile_options sets the flag for targets (executables and libraries)
    add_compile_options(/Wall)
else()
    add_compile_options(-Wall)
endif()
```

#### Part 2/2 Run Bash Commands

bash

```
cmake ..
```

___

<a name="loops"></a>

### :nine: loops

foreach

```cmake
foreach(currentElement arg1 arg2 arg3)
 #do something
endforeach()

foreach(currentElement IN LISTS list1 list2)
 #do something
endforeach()

foreach(currentElement IN LISTS list1 ITEMS extraItem1 extraItem2)
 #do something
endforeach()
```

while

```cmake
while(condition)
 #do something
endwhile()
```

iteruption

```cmake
break()
continue()
```

#### Part 1/2 CMakeLists.txt file

```cmake
cmake_minimum_required(VERSION 3.0)
project(loops)

cmake_minimum_required(VERSION 3.0)
project(loops)

#Example 1
set(a 1)

foreach(example1 ${a} b c d e f)
    message("example1 = ${example1}")
endforeach()

#Example 2
set(list_a 1 2 3 4 5 6 7)
set(list_b 10 20 30 40 50)

foreach(example2 IN LISTS list_a list_b)
    message("example2 = ${example2}")
endforeach()


#Example 3
set(list_a 1 2 3 4 5 6 7)
set(list_b 10 20 30 40 50)

foreach(example3 IN LISTS list_a list_b ITEMS x y LISTS list_b)
    message("example3 = ${example3}")
endforeach()


#Example 4
set(list_a 1 2 3 4 5 6 7)
set(list_b 10 20 30 40 50)
set(list_c a b c)

foreach(example4 IN ZIP_LISTS list_a list_b list_c)
    message("example4 = ${example4_0} ${example4_1} ${example4_2}")
endforeach()

#Example 5 indexed for loops notice that the end is included
#for(int i = 0; i < 10; i++)

foreach(example5 RANGE 0 9)
    message("example5 = ${example5} ")
endforeach()

```

#### Part 2/2 Run Bash Commands

bash

```
cmake ..
```

___

<a name="project_structure"></a>

### :one::zero: :recycle: project_structure

if you have several libraries in several folders use command "add_subdirectory"
in that case you will also need to create CMakeLists.txt in each folder

#### Part 1/3 CMakeLists.txt files

```cmake
cmake_minimum_required(VERSION 3.0)
project(sortdemo)

#In these subdirectories add_library methods are created
add_subdirectory(sort)
add_subdirectory(print)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE my_sort_lib my_print_lib)
```

folder print

```cmake
project(print)
message("print library")
add_library(my_print_lib print.cpp)
```

folder sort

```cmake
project(sort)
message("sort library")
add_library(my_sort_lib sort.cpp)
```

#### Part 2/3 Run Bash Commands

bash

move files (move filename foldername)

```
move print.cpp print
move sort.cpp sort
```

show folder structure

```
tree
```

configure, build and run

```
cmake ..
cmake --build .
Debug\sortdemo
```

#### Part 3/3 main.cpp

main.cpp must include folder directory

```cpp
#include <iostream>
#include "sort/sort.hpp" //here is the subdirectory similar like in CGAL -> #include <CGAL/Intersections.h>
#include "print/print.hpp" //here is the subdirectory

int main(int argc, char **argv)
{
  std::vector<double> example = {4, 5.4, 9.1, 1, -2.2};
  std::cout << "Before:\n" ;
  myPrint(example);
  
  mySort(example);  
  
  std::cout << "\nAfter:\n";
  myPrint(example);
  return 0;
}
```

___

<a name="project_structure_source_and_include_folders"></a>

### :one::one: :recycle: project_structure_source_and_include_folders

* hpp and cpp files are separated into include and src folders,
* only src folders and subfolders contain CMakeLists

* source files links header files with angular brackets <> instead of "" e.g. #include <print.hpp>
* tree /f

```
    CMakeLists.txt
    main.cpp
  
    build
    include
    ├───print
    │       print.hpp
    │
    └───sort
            sort.hpp
 
    src
    │   CMakeLists.txt
    │
    ├───print
    │       CMakeLists.txt
    │       print.cpp
    │
    └───sort
            CMakeLists.txt
            sort.cpp
```

#### Part 1/2 CMakeLists.txt file

main CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.0)
project(sortdemo)

# In these subdirectories add_library methods are created
# Do not need to add "include" (add_subdirectory(include)) directory because include is linked in
# src/CMakeLists.txt and src/sort/CMakeLists.txt and src/print/CMakeLists.txt
# src/sort/CMakeLists.txt target_include_directories(my_sort_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/sort)
add_subdirectory(src)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE my_sort_lib my_print_lib)
```

src/CMakeLists.txt folder links sub-folder like this:

```cmake
add_subdirectory(sort)
add_subdirectory(print)
```

src/print/CMakeLists.txt contains such a linking procedure:

```cmake
project(print)

add_library(my_print_lib print.cpp)

#special linking to header in include directory:
target_include_directories(my_print_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/print)
```

#### Part 2/2 Run Bash Commands

bash

```
cmake ..
cmake --build
Debug\sortdemo
```
