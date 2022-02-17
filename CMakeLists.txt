cmake_minimum_required(VERSION 3.22)
project(
    md407 
    VERSION 0.1.0 
    LANGUAGES C
)

# Add c files in the src dir to a executable
file(GLOB sources src/*.c)
add_executable(md407 ${sources})

# ======== NO NEED TO EDIT BELOW THIS LINE ========

# Add linker script for md407 memmory layout
target_link_options(md407 PUBLIC -T ${CMAKE_SOURCE_DIR}/md407.ld)
set_property(TARGET md407 PROPERTY LINK_DEPENDS ${CMAKE_SOURCE_DIR}/md407.ld)

# Enable Link time optimization if supported by the compiler
include(CheckIPOSupported)
check_ipo_supported(RESULT result OUTPUT output)
if(result)
  set_property(TARGET md407 PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
else()
  message(WARNING "IPO is not supported: ${output}")
endif()

# Generate .s19 file for flashing the device
add_custom_command(
    OUTPUT md407.s19
    DEPENDS md407
    COMMENT "Generating md407.s19..."
    COMMAND ${CMAKE_OBJCOPY} -S -O srec md407 ${PROJECT_BINARY_DIR}/md407.s19
    VERBATIM
)

# Generate .lst file for inspecting the assembly
add_custom_command(
    OUTPUT md407.lst
    DEPENDS md407
    COMMENT "Generating md407.lst..."
    COMMAND ${CMAKE_OBJDUMP} -D -S $<TARGET_FILE:md407> > ${PROJECT_BINARY_DIR}/md407.lst
    VERBATIM
)

# Always generate .s19 and .lst files
add_custom_target(
    generate_files ALL
    DEPENDS md407.s19 md407.lst
)