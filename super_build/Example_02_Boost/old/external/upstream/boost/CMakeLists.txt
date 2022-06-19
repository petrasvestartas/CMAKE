###############################################################################
#First we attemt to find the Boost components needed for the minimum version
###############################################################################
find_package(Boost ${Boost_MINIMUM_REQUIRED} QUIET COMPONENTS ${BOOST_COMPONENTS_REQUIRED})


###############################################################################
#if it is found, we add an interface library boost_external
###############################################################################

if(Boost_FOUND)
    message(STATUS "Found Boost ${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.${Boost_SUBMINOR_VERSION}")
    add_library(boost_external INTERFACE)
else()
    message(STATUS "Boost $(Boost_MINIMUM_REQUIRED) count not be located, Building Boost 1.61.0 instead.")
endif()