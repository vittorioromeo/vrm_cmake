# Copyright (c) 2015-2020 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Dependencies.
include("${CMAKE_CURRENT_LIST_DIR}/vc_include.cmake")
vrm_cmake_include_vc_dependency_once(vc_log)

# Looks for library folder `extlib` in paths starting with `extlibs`
# or `dir`.
macro(vrm_cmake_find_extlib_in extlib dir)
#{
    vrm_cmake_message("finding ${extlib} in ${CMAKE_SOURCE_DIR}/${dir}/${extlib}")

    list(APPEND CMAKE_MODULE_PATH
        "${CMAKE_SOURCE_DIR}/${dir}/${extlib}/cmake/modules/"
        "${CMAKE_SOURCE_DIR}/${dir}/${extlib}/cmake/"
        "${CMAKE_SOURCE_DIR}/extlibs/${extlib}/cmake/modules/"
        "${CMAKE_SOURCE_DIR}/extlibs/${extlib}/cmake/")

    find_package("${extlib}" REQUIRED)
    string(TOUPPER "${extlib}" ${extlib}_UPPER)
#}
endmacro()

# Looks for `extlib` in `dir` and includes it.
macro(vrm_cmake_find_extlib_in_and_default_include extlib dir)
#{
    vrm_cmake_find_extlib_in(${extlib} ${dir})
    include_directories("${${${extlib}_UPPER}_INCLUDE_DIR}")
#}
endmacro()

# Looks for `extlib` in the source folder and includes it.
macro(vrm_cmake_find_extlib extlib)
#{
    vrm_cmake_message("finding ${extlib} in ./..")
    vrm_cmake_find_extlib_in_and_default_include(${extlib} "..")
#}
endmacro()

# Target-based version. Looks for `extlib` in `dir` and includes it.
macro(vrm_cmake_find_extlib_in_and_default_include_for_target target extlib dir)
#{
    vrm_cmake_find_extlib_in(${extlib} ${dir})
    target_include_directories(${target} PUBLIC "${${${extlib}_UPPER}_INCLUDE_DIR}")
#}
endmacro()

# Target-based version. Looks for `extlib` in the source folder and includes it.
macro(vrm_cmake_find_extlib_for_target target extlib)
#{
    vrm_cmake_message("finding ${extlib} in ./..")
    vrm_cmake_find_extlib_in_and_default_include_for_target(${target} ${extlib} "..")
#}
endmacro()
