#sematic versioning
#SPLIT: do you want to split the version into major, minor and path?
#DEBUG_INFO: print extra info
#OUTPUT_VARIABLE_NAME: "VERSION" if not specified
#FILE_NAME: "Version" if not specified
function(read_sember)

    set(PREFIX "ARG")
    set(NO_VALUE_ARGS "SPLIT" "DEBUG_INFO")
    set(SINGLE_VALUE_ARGS "OUTPUT_VARIABLE_NAME" "FILE_NAME")
    set(MULTI_VALUE_ARGS "MV" )

    cmake_parse_arguments(
        ${PREFIX}
        "${NO_VALUE_ARGS}"
        "${SINGLE_VALUE_ARGS}"
        "${MULTI_VALUE_ARGS}"
        ${ARGV}
    )

    if($(PREFIX)_DEBUG_INFO)
        message("${PREFIX}_DEBUG_INFO=${${PREFIX}_DEBUG_INFO}")
        message("${PREFIX}_SPLIT=${${PREFIX}_SPLIT}")
        message("${PREFIX}_OUTPUT_VARIABLE_NAME=${${PREFIX}_OUTPUT_VARIABLE_NAME}")
        message("${PREFIX}_FILE_NAME=${${PREFIX}_FILE_NAME}")
        message("${PREFIX}_MV=${${PREFIX}_MV}")
    endif()

    FILE(READ "${${PREFIX}_FILE_NAME}" FILE_CONTENT)
    string(STRIP "${FILE_CONTENT}" FILE_CONTENT)

    if(NOT ${PREFIX}_OUTPUT_VARIABLE_NAME)
        set(${PREFIX}_OUTPUT_VARIABLE_NAME "VERSION")
    endif()

    if(${PREFIX}_SPLIT)
        string(REPLACE "." ";" SEMVER_COMPONENTS "${FILE_CONTENT}")
        message("SEMVER_COMPONENTS=${SEMVER_COMPONENTS}")
        list(GET SEMVER_COMPONENTS 0 MAJOR)
        list(GET SEMVER_COMPONENTS 1 MINOR)
        list(GET SEMVER_COMPONENTS 2 PATCH)
        set(${${PREFIX}_OUTPUT_VARIABLE_NAME}_MAJOR ${MAJOR} PARENT_SCOPE)
        set(${${PREFIX}_OUTPUT_VARIABLE_NAME}_MINOR ${MINOR} PARENT_SCOPE)
        set(${${PREFIX}_OUTPUT_VARIABLE_NAME}_PATCH ${PATCH} PARENT_SCOPE)
    else()
        set(${${PREFIX}_OUTPUT_VARIABLE_NAME} ${FILE_CONTENT} PARENT_SCOPE)
    endif()

    message("semver.cmake included")
    message("in semver.cmake: CMAKE_CURRENT_LIST_FILE=${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}")

endfunction()