include(CheckIPOSupported)

function(add_md407_executable name sources)
  # Add the executable
  #file(GLOB sources src/*.c)
  message(STATUS "Adding executable ${name} with sources ${sources}")
  add_executable(${name} ${sources})
  #target_include_directories(${name} PRIVATE ${CMAKE_SOURCE_DIR}/src)

  # Link to the libstm library if it is enabled
  if(TARGET libstm)
    message(STATUS "Linking ${name} to libstm")
    target_link_libraries(${name} libstm)
  endif()

  # Add linker script for md407 memmory layout
  target_link_options(${name} PUBLIC -T ${CMAKE_SOURCE_DIR}/md407.ld)
  set_property(TARGET ${name} PROPERTY LINK_DEPENDS ${CMAKE_SOURCE_DIR}/md407.ld) 

  # Enable Link time optimization if supported by the compiler
  check_ipo_supported(RESULT result OUTPUT output)
  if(result)
    set_property(TARGET ${name} PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    message(WARNING "IPO is not supported: ${output}")
  endif()

  # Generate .s19 file for flashing the device
  add_custom_command(
    OUTPUT ${name}.s19
    DEPENDS ${name}
    COMMENT "Generating ${name}.s19..."
    COMMAND ${CMAKE_OBJCOPY} -S -O srec ${name} ${PROJECT_BINARY_DIR}/${name}.s19
    VERBATIM
  )

  # Generate .lst file for inspecting the assembly
  add_custom_command(
    OUTPUT ${name}.lst
    DEPENDS ${name}
    COMMENT "Generating ${name}.lst..."
    COMMAND ${CMAKE_OBJDUMP} -D -S $<TARGET_FILE:${name}> > ${PROJECT_BINARY_DIR}/${name}.lst
    VERBATIM
  )

  # Always generate .s19 and .lst files
  add_custom_target(
    generate_${name}_files ALL
    DEPENDS ${name}.s19 ${name}.lst
  )
endfunction()
