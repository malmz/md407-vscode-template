include(CheckIPOSupported)

# Set target to use a link script
function(add_link_script target script)
    # Set the target to use the link script
    target_link_options(${target} PUBLIC -T ${script})
    # Set the link script as a dependency so the target is rebuilt when the linker script is changed
    set_target_properties(${target} PROPERTIES LINK_DEPENDS ${script}) 
endfunction()

# Enable Link time optimization if supported by the compiler
function(target_set_lto target)
  check_ipo_supported(RESULT result OUTPUT output)
  if(result)
    set_property(TARGET ${target} PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    message(WARNING "IPO is not supported: ${output}")
  endif()
endfunction()



# Create a custom target to generate .lst and .s19 files for target
function(add_decompile_files target)
  # Generate .s19 file for flashing the device
  add_custom_command(
    OUTPUT ${target}.s19
    DEPENDS ${target}
    COMMENT "Generating ${target}.s19..."
    COMMAND ${CMAKE_OBJCOPY} -S -O srec ${target} ${PROJECT_BINARY_DIR}/${target}.s19
    VERBATIM
  )

  # Generate .lst file for inspecting the assembly
  add_custom_command(
    OUTPUT ${target}.lst
    DEPENDS ${target}
    COMMENT "Generating ${target}.lst..."
    COMMAND ${CMAKE_OBJDUMP} -D -S $<TARGET_FILE:${target}> > ${PROJECT_BINARY_DIR}/${target}.lst
    VERBATIM
  )

  # Create build target to generate .s19 and .lst files
  # `ALL` tells cmake to run when no target is provided
  add_custom_target(
    generate_${target}_decompiles ALL
    DEPENDS ${target}.s19 ${target}.lst
  )
endfunction()

function(target_set_md407 target)
  # Link to the libstm library if it is enabled
  if(TARGET libstm)
    message(STATUS "Linking ${target} to libstm")
    target_link_libraries(${target} libstm)
  endif()

  # Add linker script for md407 memmory layout
  add_link_script(${target} ${CMAKE_SOURCE_DIR}/md407.ld)

  # Enable Link time optimization if supported by the compiler
  target_set_lto(${target})

  # Generate .lst and .s19 files
  add_decompile_files(${target})
endfunction()


function(add_md407_executable target sources)
  # Add the executable
  add_executable(${target} ${sources})

  # Link to the libstm library if it is enabled
  if(TARGET libstm)
    message(STATUS "Linking ${target} to libstm")
    target_link_libraries(${target} libstm)
  endif()

  # Add linker script for md407 memmory layout
  add_link_script(${target} ${CMAKE_SOURCE_DIR}/md407.ld)

  # Enable Link time optimization if supported by the compiler
  target_set_lto(${target})

  # Generate .lst and .s19 files
  add_decompile_files(${target})
endfunction()