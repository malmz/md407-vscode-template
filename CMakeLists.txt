cmake_minimum_required(VERSION 3.22)
project(
  md407 
  VERSION 0.1.0 
  LANGUAGES C
)
include(cmake/utils.cmake)

# Uncomment to include libstm
#add_subdirectory(lib)

# Add source files
set(sources 
  src/main.c
  src/startup.c
  src/add.c
)

# Add an executable target
add_md407_executable(md407 "${sources}")
