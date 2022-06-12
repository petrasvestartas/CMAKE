cmake_minimum_required(VERSION 3.0)
#set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})




project(sortdemo)

#This MUST be after the project name
if (MSVC)
 message("Petras is talking to you: MSVC Compiler, this line is not needed if MinGW compiler is used")
 set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

 #set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
 #message("CMAKE_RUNTIME_OUTPUT_DIRECTORY=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")

 #this works only after the project is built
 #add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
 # COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_RUNTIME_DLLS:${PROJECT_NAME}> $<TARGET_FILE_DIR:${PROJECT_NAME}>
 # COMMAND_EXPAND_LISTS
 # )
endif (MSVC)

# bash:
# cmake  -G "Visual Studio 17 2022" -A x64 ..  && cmake --build . --target ALL_BUILD --config Release && cmake --install .
# cmake  -DBUILD_SHARED_LIBS=ON -G "Visual Studio 17 2022" -A x64  ..  && cmake  --build . --config Release   && cmake --install .
message("CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")




#In these subdirectories add_library methods are created
#Do not need to add "include" directory because include is linked in 
#src/sort/CMakeLists.txt target_include_directories(my_sort_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/sort)
add_subdirectory(src)


#add executable that links the libraries
add_executable(${PROJECT_NAME}  main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE my_sort_lib my_print_lib)



#For SHARED libs, enable copy symbols and copy .dlls


#Copy indifividual files:
#install(FILES include/sort/sort.hpp DESTINATION ${CMAKE_INSTALL_PREFIX}/include/sort)
#install(FILES include/print/print.hpp DESTINATION ${CMAKE_INSTALL_PREFIX}/include/print)


#install individual files
#Better way to copy directory instead of individual files:
#install(DIRECTORY include/sort TYPE INCLUDE)
#install(DIRECTORY include/print TYPE INCLUDE)

message("PETRAS_CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")


#install targets / libraries
#to use find_package(sortdemo) you need to add EXPORT
#install(
#    TARGETS my_sort_lib my_print_lib
#    EXPORT export_sort_demo
#    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
#

#to generate export_sort_demo file, you have to call install again
#install(
#    EXPORT export_sort_demo
#    FILE ${CMAKE_PROJECT_NAME}-config.cmake
#    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
#)