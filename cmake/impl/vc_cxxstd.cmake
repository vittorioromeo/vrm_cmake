# Copyright (c) 2015-2016 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Dependencies.
include("${CMAKE_CURRENT_LIST_DIR}/vc_include.cmake")
vrm_cmake_include_vc_dependency_once(vc_log)

# Sets the required C++ standard version to `x`.
macro(vrm_cmake_set_cxxstd x)
#{
    vrm_cmake_message("setting required C++ standard to ${x}")

    set(CMAKE_CXX_STANDARD "${x}")
    set(CMAKE_CXX_STANDARD_REQUIRED on)
#}
endmacro()