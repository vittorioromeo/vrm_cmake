# Copyright (c) 2015-2020 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Includes a CMake module only once.
macro(vrm_cmake_include_module_once x)
#{
    if(NOT ${x}_INCLUDED)
    #{
        include(${x})
        set("${x}_INCLUDED" true)
    #}
    endif()
#}
endmacro()

# Includes an inner `vrm_cmake` "impl module" only once.
macro(vrm_cmake_include_vc_impl_once x)
#{
    if(NOT ${x}_INCLUDED)
    #{
        include("${CMAKE_CURRENT_LIST_DIR}/impl/${x}.cmake")
        set("${x}_INCLUDED" true)
    #}
    endif()
#}
endmacro()

# Includes an inner `vrm_cmake` dependency only once.
macro(vrm_cmake_include_vc_dependency_once x)
#{
    if(NOT ${x}_INCLUDED)
    #{
        include("${CMAKE_CURRENT_LIST_DIR}/${x}.cmake")
        set("${x}_INCLUDED" true)
    #}
    endif()
#}
endmacro()
