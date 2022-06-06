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