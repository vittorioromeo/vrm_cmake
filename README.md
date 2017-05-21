# vrm_cmake

> **Shared CMake aliases, macros and functions.**

[![stability][badge.stability]][stability]
[![license][badge.license]][license]
[![gratipay][badge.gratipay]][gratipay]

[badge.stability]: https://img.shields.io/badge/stability-unstable-yellow.svg?style=flat-square
[badge.license]: http://img.shields.io/badge/license-afl%203.0-blue.svg?style=flat-square
[badge.gratipay]: https://img.shields.io/gratipay/user/SuperV1234.svg?style=flat-square

[stability]: http://github.com/badges/stability-badges
[license]: https://github.com/SuperV1234/vrm_cmake/blob/master/LICENSE
[gratipay]: https://gratipay.com/~SuperV1234/



## Intended usage (quick start)

1. Add this repository as a submodule of your project, in `./extlibs/vrm_cmake`:

    ```bash
    git submodule add   https://github.com/SuperV1234/vrm_cmake.git   your_project/extlibs/vrm_cmake
    ```

2. Include the repository in your project's CMakeLists:
    
    ```cmake
    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/extlibs/vrm_cmake/cmake/")
    include(vrm_cmake)
    ```
