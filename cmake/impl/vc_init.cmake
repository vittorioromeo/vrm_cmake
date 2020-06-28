# Copyright (c) 2015-2020 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Dependencies.
include("${CMAKE_CURRENT_LIST_DIR}/vc_include.cmake")
vrm_cmake_include_vc_dependency_once(vc_log)
vrm_cmake_include_vc_dependency_once(vc_cxxstd)

# Enable export of compile commands.
macro(vrm_cmake_init_export_compile_commands)
#{
    set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
#}
endmacro()

# Initializes the `PROJECT_NAME_UPPER` variable.
# It contains the project name, uppercase.
macro(vrm_cmake_init_project_name_upper)
#{
    set(PROJECT_NAME_UPPER "")
    string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_UPPER)
#}
endmacro()

# Initializes the `${PROJECT_NAME_UPPER}_SOURCE_DIR` variable.
macro(vrm_cmake_init_project_source_dir)
#{
    set("${PROJECT_NAME_UPPER}_SOURCE_DIR" "${CMAKE_CURRENT_SOURCE_DIR}")
#}
endmacro()

# Appends common module paths.
macro(vrm_cmake_init_project_common_module_paths)
#{
    list(APPEND CMAKE_MODULE_PATH
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
#}
endmacro()

# Initializes common data for a C++ CMake project.
# * Project name and uppercase project name.
# * Appends common module paths.
# * Enables testing.
# * Sets C++ standard to specified `cxx_standard`.
macro(vrm_cmake_init_project_with_cxx_standard project_name cxx_standard)
#{
    vrm_cmake_set_cxxstd(${cxx_standard})

    project(${project_name} CXX)
    enable_testing()

    vrm_cmake_init_export_compile_commands()
    vrm_cmake_init_project_name_upper()
    vrm_cmake_init_project_source_dir()
    vrm_cmake_init_project_common_module_paths()

    vrm_cmake_message("initialized project ${project_name}")
#}
endmacro()

# Initializes common data for a C++ CMake project.
# * Project name and uppercase project name.
# * Appends common module paths.
# * Enables testing.
# * Sets C++ standard to 17.
macro(vrm_cmake_init_project project_name)
#{
    vrm_cmake_init_project_with_cxx_standard(${project_name} 17)
#}
endmacro()

