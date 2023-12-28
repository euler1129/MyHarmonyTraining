# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyHarmonyTraining)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/opencv2)

add_library(bcr SHARED hello.cpp)

target_link_libraries(bcr PUBLIC libace_napi.z.so)