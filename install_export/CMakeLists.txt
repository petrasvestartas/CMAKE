cmake_minimum_required(VERSION 3.0)

project(sortdemo)

#THIS MUST BE DIRECTLY AFTER PROJECT NAME E.G. project(sortdemo)
#bash: cmake  -DBUILD_SHARED_LIBS=ON -G "Visual Studio 17 2022" -A x64  ..  && cmake  --build . --config Release && cmake  --install . 
#bash: before release add this if needed --target ALL_BUILD
if (MSVC)
 message("Petras is talking to you: MSVC Compiler, this line is not needed if MinGW compiler is used")
 #Without this message no .dll file is created, place ir after the project name
 set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

 #This one copies .dlls to project build directory
 set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
 message(CMAKE_RUNTIME_OUTPUT_DIRECTORY)

endif (MSVC)


#In these subdirectories add_library methods are created
#Do not need to add "include" directory because include is linked in 
#src/sort/CMakeLists.txt target_include_directories(my_sort_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/sort)
add_subdirectory(src)


#add executable that links the libraries
add_executable(${PROJECT_NAME}  main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE my_sort_lib my_print_lib)


message("CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")

####################################################################################################################
#INSTALL
####################################################################################################################
#Copy individual files:
#install(FILES include/sort/sort.hpp DESTINATION ${CMAKE_INSTALL_PREFIX}/include/sort)
#install(FILES include/print/print.hpp DESTINATION ${CMAKE_INSTALL_PREFIX}/include/print)
#install individual files
#Better way to copy directory instead of individual files:
install(DIRECTORY include/sort TYPE INCLUDE)
install(DIRECTORY include/print TYPE INCLUDE)

#Files will be copied here:
message("PETRAS_CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")

#install targets / libraries
#to use find_package(sortdemo) you need to add EXPORT
install(
    TARGETS my_sort_lib my_print_lib
    EXPORT export_sort_demo
    RUNTIME DESTINATION "bin"
    LIBRARY DESTINATION "lib"
    ARCHIVE DESTINATION "lib"
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/#${CMAKE_PROJECT_NAME}
)

#to generate export_sort_demo file, you have to call install again
#Destiniation should be indetical
#FILE keyword renames the file to specified one
install(
    EXPORT export_sort_demo
    FILE ${CMAKE_PROJECT_NAME}-config.cmake
    DESTINATION ${CMAKE_INSTALL_PREFIX}/#${CMAKE_PROJECT_NAME}
)