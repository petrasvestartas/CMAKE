cmake_minimum_required(VERSION 3.0)
project(numeric_values)


set (x "1")
set (y 3)
set (z "4")

#(x+y)*z
math(EXPR result "(${x}+${y})*${z}")
message("result: ${result}")