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
macro(vrm_cmake_header_only_install target_name file_list src_dir dest_dir)
#{
    vrm_cmake_message("added header-only install target")

    # Create interface library (will not be compiled to objects) and add
    # all the source files to it.
    add_library(${target_name} INTERFACE)
    target_sources(${target_name} INTERFACE ${file_list})
    target_include_directories(${target_name} INTERFACE ${src_dir})

    # In order to allow IDEs such as "Qt Creator" to correctly display the
    # files that compose the header-only library, a custom target needs
    # to be added.
    add_custom_target("${target_name}_IDE_HELPER" SOURCES ${file_list})
    set_source_files_properties(${file_list} PROPERTIES HEADER_FILE_ONLY 1)

    install(DIRECTORY ${src_dir} DESTINATION ${dest_dir})
#}
endmacro()

# Creates an install target that installs the project as an header-only library.
# Automatically globs `src_dir`.
# User-specified target name.
macro(vrm_cmake_header_only_install_glob_tn target_name src_dir dest_dir)
#{
    vrm_cmake_message("globbing ${src_dir} for header-only install (target: ${target_name})")

    # Glob library header files.
    file(GLOB_RECURSE INSTALL_FILES_LIST "${src_dir}/*")

    # Create header-only install target.
    vrm_cmake_header_only_install(${target_name} "${INSTALL_FILES_LIST}" "${src_dir}" "${dest_dir}")
#}
endmacro()

# Creates an install target that installs the project as an header-only library.
# Automatically globs `src_dir`.
# Default target name: "HEADER_ONLY_TARGET"
macro(vrm_cmake_header_only_install_glob src_dir dest_dir)
#{
    vrm_cmake_header_only_install_glob_tn(HEADER_ONLY_TARGET "${src_dir}" "${dest_dir}")
#}
endmacro()
