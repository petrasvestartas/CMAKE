cmake_minimum_required(VERSION 3.0)

#cmake -G "Visual Studio 17 2022" -A x64 .. && cmake --build . && cmake --install .
message("CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")

project(sortdemo)

#In these subdirectories add_library methods are created
#Do not need to add "include" directory because include is linked in 
#src/sort/CMakeLists.txt target_include_directories(my_sort_lib PUBLIC ${CMAKE_SOURCE_DIR}/include/sort)
add_subdirectory(src)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE my_sort_lib my_print_lib)

#Copy indifividual files:
#install(FILES include/sort/sort.hpp DESTINATION ${CMAKE_INSTALL_PREFIX}/include/sort)
#install(FILES include/print/print.hpp DESTINATION ${CMAKE_INSTALL_PREFIX}/include/print)

#Better way to copy directory instead of individual files:
install(DIRECTORY include/sort TYPE INCLUDE)
install(DIRECTORY include/print TYPE INCLUDE)