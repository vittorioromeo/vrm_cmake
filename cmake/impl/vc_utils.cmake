# Copyright (c) 2015-2016 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Returns a list of globbed objects except the listed ones.
macro(vrm_cmake_list_remove_glob list glob)
#{
    list(REMOVE_ITEM ${list} ${ARGN})
#}
endmacro()