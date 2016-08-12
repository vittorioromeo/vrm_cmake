# Copyright (c) 2015-2016 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Dependencies.
include("${CMAKE_CURRENT_LIST_DIR}/vc_include.cmake")
vrm_cmake_include_vc_dependency_once(vc_log)

# Creates an install target that installs the project as an header-only library.
# Library files are in the list `file_list`.
# The `src_dir` is copied to `dest_dir`.
macro(vrm_cmake_header_only_install file_list src_dir dest_dir)
#{
    vrm_cmake_message("added header-only install target")

    # set_source_files_properties(${file_list} PROPERTIES HEADER_FILE_ONLY 1)
    add_custom_target(HEADER_ONLY_TARGET SOURCES ${file_list})
    set_target_properties(HEADER_ONLY_TARGET PROPERTIES LINKER_LANGUAGE CXX)
    install(DIRECTORY ${src_dir} DESTINATION ${dest_dir})
#}
endmacro()

# Creates an install target that installs the project as an header-only library.
# Automatically globs `src_dir`.
macro(vrm_cmake_header_only_install_glob src_dir dest_dir)
#{
    vrm_cmake_message("globbing ${src_dir} for header-only install")

    # Glob library header files.
    file(GLOB_RECURSE INSTALL_FILES_LIST "${src_dir}/*")

    # Create header-only install target.
    vrm_cmake_header_only_install("${INSTALL_FILES_LIST}" "${src_dir}" "${dest_dir}")
#}
endmacro()
