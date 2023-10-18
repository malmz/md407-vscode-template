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

# Create a build target with provided sources
add_executable(md407 "${sources}")

# Set md407 specific options on target
target_set_md407(md407)
