# Copyright (c) 2015-2020 Vittorio Romeo
# License: Academic Free License ("AFL") v. 3.0
# AFL License page: http://opensource.org/licenses/AFL-3.0
# http://vittorioromeo.info | vittorio.romeo@outlook.com

# Module inclusion utilities.
include(impl/vc_include)

# Logging/messages.
vrm_cmake_include_vc_impl_once(vc_log)

# Various CMake utils.
vrm_cmake_include_vc_impl_once(vc_utils)

# Compiler/environment detection.
vrm_cmake_include_vc_impl_once(vc_detection)

# C++ standard requirements.
vrm_cmake_include_vc_impl_once(vc_cxxstd)

# Project initialization.
vrm_cmake_include_vc_impl_once(vc_init)

# Compiler flags.
vrm_cmake_include_vc_impl_once(vc_flags)

# Extlib/submodule detection/inclusion.
vrm_cmake_include_vc_impl_once(vc_extlib)

# Testing.
vrm_cmake_include_vc_impl_once(vc_testing)

# Installation.
vrm_cmake_include_vc_impl_once(vc_install)

# Third-party common modules.
vrm_cmake_include_vc_impl_once(vc_third_party)
