# the name of the target operating system
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION "1.0.0")
set(CMAKE_SYSTEM_PROCESSOR ARM)

if (USE_SYSROOT)
  message(STATUS "Using sysroot")
  execute_process(
    COMMAND ${CMAKE_C_COMPILER} --print-sysroot
    OUTPUT_VARIABLE CMAKE_FIND_ROOT_PATH
  )
  set(CMAKE_FIND_ROOT_PATH "${CMAKE_FIND_ROOT_PATH}/..")
else()
  message(STATUS "CMAKE_HOST_SYSTEM_NAME: ${CMAKE_HOST_SYSTEM_NAME}")
  message(STATUS "Using default paths for sysroot (Not Widnows)")

  if (CMAKE_HOST_SYSTEM_NAME STREQUAL "Darwin")
    set(CMAKE_FIND_ROOT_PATH /Applications/ARM)
  elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
    set(CMAKE_FIND_ROOT_PATH /usr)
  elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
    set(CMAKE_FIND_ROOT_PATH "C:/Program Files (x86)/GNU Tools ARM Embedded/${VERSION}")
  endif()
endif()

message(STATUS "CMAKE_FIND_ROOT_PATH: ${CMAKE_FIND_ROOT_PATH}")

set(ARM_LIB_DIRS 
  ${CMAKE_FIND_ROOT_PATH}/lib/gcc/arm-none-eabi/${CMAKE_C_COMPILER_VERSION}/thumb/v6-m/nofp
  ${CMAKE_FIND_ROOT_PATH}/arm-none-eabi/lib/thumb/v6-m/nofp
)

# which compilers to use for C and C++
#set(CMAKE_C_COMPILER arm-none-eabi-gcc)
#set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

# where is the target environment located
set(CMAKE_AR arm-none-eabi-ar)
set(CMAKE_ASM_COMPILER arm-none-eabi-as)
set(CMAKE_LINKER arm-none-eabi-ld)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(CMAKE_RANLIB arm-none-eabi-ranlib)

#set(CMAKE_FIND_ROOT_PATH /Applications/ARM)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

add_compile_options(
  -mthumb
  -march=armv7e-m
  -mlittle-endian
  -mfloat-abi=soft
  -ffreestanding
  -specs=nosys.specs
)

add_link_options(
  -nostartfiles
)


