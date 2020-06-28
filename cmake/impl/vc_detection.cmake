# Copyright (c) 2015-2020 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Dependencies.
include("${CMAKE_CURRENT_LIST_DIR}/vc_include.cmake")
vrm_cmake_include_vc_dependency_once(vc_log)

# Sets `flag` to `true` if the compiler is gcc.
macro(vrm_cmake_check_gcc flag)
#{
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    #{
        vrm_cmake_message("detected gcc, setting ${flag} to `true`")
        set(${flag} true)
    #}
    else()
    #{
        set(${flag} false)
    #}
    endif()
#}
endmacro()

# Sets `flag` to `true` if the compiler is clang.
macro(vrm_cmake_check_clang flag)
#{
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    #{
        vrm_cmake_message("detected clang, setting ${flag} to `true`")
        set(${flag} true)
    #}
    else()
    #{
        set(${flag} false)
    #}
    endif()
#}
endmacro()


# Sets `flag` to `true` if the compiler is msvc.
macro(vrm_cmake_check_msvc flag)
#{
    if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    #{
        vrm_cmake_message("detected MSVC, setting ${flag} to `true`")
        set(${flag} true)
    #}
    else()
    #{
        set(${flag} false)
    #}
    endif()
#}
endmacro()

vrm_cmake_check_gcc(VRM_CMAKE_COMPILER_IS_GCC)
vrm_cmake_check_clang(VRM_CMAKE_COMPILER_IS_CLANG)
vrm_cmake_check_msvc(VRM_CMAKE_COMPILER_IS_MSVC)
