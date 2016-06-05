# vrm_cmake
Shared CMake aliases, macros and functions (WIP)

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