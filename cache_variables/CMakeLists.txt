cmake_minimum_required(VERSION 3.0)
project(cache_example)

#Normal varaible is empty if the CMakeLists is called twice
message("NON_CACHE_VAR = ${NON_CACHE_VAR}")
set(NON_CACHE_VAR "Initial value")
message("NON_CACHE_VAR = ${NON_CACHE_VAR}")

#Cache variables stays within multiple calls to cmake
message("CACHE_VAR = ${CACHE_VAR}")
set(CACHE_VAR "Initial value 2" CACHE STRING "Help me with this cache variable" FORCE)
message("CACHE_VAR = ${CACHE_VAR}")

#To modify variables use -D Keyword " "cmake -DCACHE_VAR=set_by_Petras .. "