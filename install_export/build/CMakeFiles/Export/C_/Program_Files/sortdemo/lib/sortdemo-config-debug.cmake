#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "my_sort_lib" for configuration "Debug"
set_property(TARGET my_sort_lib APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(my_sort_lib PROPERTIES
  IMPORTED_IMPLIB_DEBUG "C:/Program Files/sortdemo/lib/my_sort_lib.lib"
  IMPORTED_LOCATION_DEBUG "C:/Program Files/sortdemo/lib/my_sort_lib.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS my_sort_lib )
list(APPEND _IMPORT_CHECK_FILES_FOR_my_sort_lib "C:/Program Files/sortdemo/lib/my_sort_lib.lib" "C:/Program Files/sortdemo/lib/my_sort_lib.dll" )

# Import target "my_print_lib" for configuration "Debug"
set_property(TARGET my_print_lib APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(my_print_lib PROPERTIES
  IMPORTED_IMPLIB_DEBUG "C:/Program Files/sortdemo/lib/my_print_lib.lib"
  IMPORTED_LOCATION_DEBUG "C:/Program Files/sortdemo/lib/my_print_lib.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS my_print_lib )
list(APPEND _IMPORT_CHECK_FILES_FOR_my_print_lib "C:/Program Files/sortdemo/lib/my_print_lib.lib" "C:/Program Files/sortdemo/lib/my_print_lib.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)