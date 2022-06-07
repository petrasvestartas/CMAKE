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
