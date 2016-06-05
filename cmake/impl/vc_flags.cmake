# Copyright (c) 2015-2016 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Dependencies.
include("${CMAKE_CURRENT_LIST_DIR}/vc_include.cmake")
vrm_cmake_include_vc_dependency_once(vc_log)
vrm_cmake_include_vc_dependency_once(vc_detection)

# Includes a CMake module only once.
macro(vrm_cmake_include_once module flag)
#{
    if(NOT ${flag})
    #{
        include(${module})
        set(${flag} true)
    #}
    endif()
#}
endmacro()

# Includes `CheckCXXCompilerFlag` if required.
macro(vrm_cmake_init_compiler_flag_check)
#{
    vrm_cmake_include_once(CheckCXXCompilerFlag
        VRM_CMAKE_COMPILER_FLAG_CHECK_INCLUDED)
#}
endmacro()

# Assumes `flag` is a valid compiler flag, and enables it.
macro(vrm_cmake_add_compiler_flag_nocheck flag)
#{
    add_compile_options(${flag})
    list(APPEND VRM_CORE_SET_FLAGS "${flag}")
#}
endmacro()

# Creates `testname` variable that checks for compiler flag `flag`.
# The flag is enabled, if possible.
macro(vrm_cmake_add_compiler_flag flag)
#{
    # Compute flag testname
    string(SUBSTRING ${flag} 1 -1 flag_0)
    string(TOUPPER ${flag_0} flag_1)
    string(REPLACE "-" "_" flag_2 ${flag_1})
    string(REPLACE "+" "X" flag_3 ${flag_2})
    string(REPLACE "=" "" flag_4 ${flag_3})

    set(PROJECT_TESTNAME "${PROJECT_NAME_UPPER}_HAS_${flag_4}")

    vrm_cmake_init_compiler_flag_check()
    check_cxx_compiler_flag(${flag} ${PROJECT_TESTNAME})

    if(${PROJECT_TESTNAME})
    #{
        vrm_cmake_add_compiler_flag_nocheck(${flag})
    #}
    endif()
#}
endmacro()

# TODO:
macro(vrm_cmake_add_compiler_flag_dispatch flag)
#{
    if(true)
    #{
        vrm_cmake_add_compiler_flag_nocheck(${flag})
    #}
    endif()
#}
endmacro()


# TODO:
macro(vrm_cmake_add_common_compiler_flags_clang)
#{
    vrm_cmake_add_compiler_flag_nocheck("-Weverything")

    vrm_cmake_add_compiler_flag_nocheck("-Wno-c++98-compat")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-c++98-compat-pedantic")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-missing-prototypes")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-newline-eof")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-reserved-id-macro")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-exit-time-destructors")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-global-constructors")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-missing-variable-declarations")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-header-hygiene")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-conversion")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-float-equal")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-old-style-cast")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-unused-macros")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-class-varargs")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-padded")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-weak-vtables")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-date-time")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-unneeded-member-function")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-covered-switch-default")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-range-loop-analysis")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-unused-member-function")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-switch-enum")
    vrm_cmake_add_compiler_flag_nocheck("-Wno-double-promotion")
#}
endmacro()

# TODO:
macro(vrm_cmake_add_common_compiler_flags_gcc)
#{
    vrm_cmake_add_compiler_flag_dispatch("-Wmisleading-indentation")
    vrm_cmake_add_compiler_flag_dispatch("-Wtautological-compare")
    vrm_cmake_add_compiler_flag_dispatch("-Wlogical-op")
    vrm_cmake_add_compiler_flag_dispatch("-Wshift-overflow=2")
    vrm_cmake_add_compiler_flag_dispatch("-Wduplicated-cond")

    vrm_cmake_add_compiler_flag_nocheck("-Wsuggest-final-types")
    vrm_cmake_add_compiler_flag_nocheck("-Wsuggest-final-methods")
    vrm_cmake_add_compiler_flag_nocheck("-Wsuggest-override")
#}
endmacro()

# Adds common compiler safety/warning flags/definitions to the project.
macro(vrm_cmake_add_common_compiler_flags_any)
#{
    vrm_cmake_message("adding common flags")

    vrm_cmake_add_compiler_flag_nocheck("-W")
    vrm_cmake_add_compiler_flag_nocheck("-Wall")
    vrm_cmake_add_compiler_flag_nocheck("-Wextra")
    vrm_cmake_add_compiler_flag_nocheck("-pedantic")

    vrm_cmake_add_compiler_flag_dispatch("-Wwrite-strings")
    vrm_cmake_add_compiler_flag_dispatch("-Wundef")
    vrm_cmake_add_compiler_flag_dispatch("-Wpointer-arith")
    vrm_cmake_add_compiler_flag_dispatch("-Wcast-align")
    vrm_cmake_add_compiler_flag_dispatch("-Wnon-virtual-dtor")
    vrm_cmake_add_compiler_flag_dispatch("-Woverloaded-virtual")
    vrm_cmake_add_compiler_flag_dispatch("-Wsequence-point")
    vrm_cmake_add_compiler_flag_dispatch("-Wnull-dereference")
    vrm_cmake_add_compiler_flag_dispatch("-Wshift-negative-value")
    
    vrm_cmake_add_compiler_flag_dispatch("-Wno-unused-local-typedefs")
    vrm_cmake_add_compiler_flag_dispatch("-Wno-missing-field-initializers")
    vrm_cmake_add_compiler_flag_dispatch("-Wno-unreachable-code")
#}
endmacro()

# TODO:
macro(vrm_cmake_add_common_compiler_flags_suggest_attribute)
#{
    vrm_cmake_message("added common suggest-attribute flags")

    vrm_cmake_add_compiler_flag("-Wsuggest-attribute=pure")
    vrm_cmake_add_compiler_flag("-Wsuggest-attribute=const")
    vrm_cmake_add_compiler_flag("-Wsuggest-attribute=noreturn")
    vrm_cmake_add_compiler_flag("-Wsuggest-attribute=format")
#}
endmacro()

# Adds common compiler release flags/definitions to the project.
macro(vrm_cmake_add_common_compiler_flags_release)
#{
    vrm_cmake_message("added common release flags")

    vrm_cmake_add_compiler_flag("-Ofast")
    vrm_cmake_add_compiler_flag("-ffast-math")

    add_definitions(-DNDEBUG -DSSVU_ASSERT_FORCE_OFF=1 -DVRM_CORE_ASSERT_FORCE_OFF=1)
#}
endmacro()

# Adds common compiler WIP_OPT flags/definitions to the project.
macro(vrm_cmake_add_common_compiler_flags_wip_opt)
#{
    vrm_cmake_message("added common WIP_OPT flags")

    vrm_cmake_add_compiler_flag("-O2")

    add_definitions(-DNDEBUG -DSSVU_ASSERT_FORCE_OFF=1 -DVRM_CORE_ASSERT_FORCE_OFF=1)
#}
endmacro()

# Adds common compiler WIP_PROFILE flags/definitions to the project.
macro(vrm_cmake_add_common_compiler_flags_wip_profile)
#{
    vrm_cmake_message("added common WIP_PROFILE flags")

    vrm_cmake_add_compiler_flag("-O2")
    vrm_cmake_add_compiler_flag("-g")

    add_definitions(-DNDEBUG -DSSVU_ASSERT_FORCE_OFF=1 -DVRM_CORE_ASSERT_FORCE_OFF=1)
#}
endmacro()

# Adds common compiler debug flags/definitions to the project.
macro(vrm_cmake_add_common_compiler_flags_debug)
#{
    vrm_cmake_message("added common debug flags")

    # TODO:
    # vrm_cmake_add_compiler_flag("-fno-omit-frame-pointer")

    vrm_cmake_add_compiler_flag("-Og")
    vrm_cmake_add_compiler_flag("-g")
#}
endmacro()

# Adds common compiler flags/definitions, depending on the build type.
macro(vrm_cmake_add_common_compiler_flags)
#{
    vrm_cmake_add_common_compiler_flags_any()

    if("${VRM_CMAKE_COMPILER_IS_GCC}")
    #{
        vrm_cmake_add_common_compiler_flags_gcc()
    #}
    elseif("${VRM_CMAKE_COMPILER_IS_CLANG}")
    #{
        vrm_cmake_add_common_compiler_flags_clang()
    #}
    endif()

    if("${CMAKE_BUILD_TYPE}" STREQUAL "RELEASE")
    #{
        vrm_cmake_message("RELEASE mode")
        vrm_cmake_add_common_compiler_flags_release()
    #}
    elseif("${CMAKE_BUILD_TYPE}" STREQUAL "DEBUG")
    #{
        vrm_cmake_message("DEBUG mode")
        vrm_cmake_add_common_compiler_flags_debug()
    #}
    elseif("${CMAKE_BUILD_TYPE}" STREQUAL "WIP")
    #{
        vrm_cmake_message("WIP mode")
    #}
    elseif("${CMAKE_BUILD_TYPE}" STREQUAL "WIP_OPT")
    #{
        vrm_cmake_message("WIP (optimized) mode")
        vrm_cmake_add_common_compiler_flags_wip_opt()
    #}
    elseif("${CMAKE_BUILD_TYPE}" STREQUAL "WIP_PROFILE")
    #{
        vrm_cmake_message("WIP (profile) mode")
        vrm_cmake_add_common_compiler_flags_wip_profile()
    #}
    else()
    #{
        vrm_cmake_message("Unknown build mode")
    #}
    endif()

    vrm_cmake_message("final flags: ${VRM_CORE_SET_FLAGS}")
#}
endmacro()