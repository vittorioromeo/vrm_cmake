# Copyright (c) 2015-2020 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Returns a list of globbed objects except the listed ones.
macro(vrm_cmake_list_remove_glob list glob)
#{
    list(REMOVE_ITEM ${list} ${ARGN})
#}
endmacro()

# Case-insensitive string comparison between `a` and `b`.
macro(vrm_cmake_case_insensitive_strequal a b)
#{
    string(TOLOWER "${a}" vrm_cmake_temp_a)
    string(TOLOWER "${b}" vrm_cmake_temp_b)

    if("${vrm_cmake_temp_a}" STREQUAL "${vrm_cmake_temp_b}")
    #{
        set(vrm_cmake_out TRUE)
    #}
    else()
    #{
        set(vrm_cmake_out FALSE)
    #}
    endif()
#}
endmacro()
