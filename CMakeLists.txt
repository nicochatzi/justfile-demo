cmake_minimum_required(VERSION 3.20)

set(CMAKE_CXX_STANDARD 20)

project(demo)

enable_testing()

include(CTest)

add_library(demo_lib INTERFACE)
target_include_directories(demo_lib
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include> 
)

add_executable(demo_app src/main.cpp)
target_link_libraries(demo_app PRIVATE demo_lib)

add_executable(demo_test test/main.cpp)
target_link_libraries(demo_test PRIVATE demo_lib)
add_test(NAME demo_test COMMAND demo_test)
