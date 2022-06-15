#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "sortdemo::my_sort_lib" for configuration "MinSizeRel"
set_property(TARGET sortdemo::my_sort_lib APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(sortdemo::my_sort_lib PROPERTIES
  IMPORTED_IMPLIB_MINSIZEREL "C:/Program Files/sortdemo/lib/my_sort_lib.lib"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/bin/my_sort_lib.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS sortdemo::my_sort_lib )
list(APPEND _IMPORT_CHECK_FILES_FOR_sortdemo::my_sort_lib "C:/Program Files/sortdemo/lib/my_sort_lib.lib" "${_IMPORT_PREFIX}/bin/my_sort_lib.dll" )

# Import target "sortdemo::my_print_lib" for configuration "MinSizeRel"
set_property(TARGET sortdemo::my_print_lib APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(sortdemo::my_print_lib PROPERTIES
  IMPORTED_IMPLIB_MINSIZEREL "C:/Program Files/sortdemo/lib/my_print_lib.lib"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/bin/my_print_lib.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS sortdemo::my_print_lib )
list(APPEND _IMPORT_CHECK_FILES_FOR_sortdemo::my_print_lib "C:/Program Files/sortdemo/lib/my_print_lib.lib" "${_IMPORT_PREFIX}/bin/my_print_lib.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
