# the name of the target operating system
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION "1.0.0")
set(CMAKE_SYSTEM_PROCESSOR ARM)

#set(CMAKE_OSX_ARCHITECTURES "")

# which compilers to use for C and C++
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

# where is the target environment located
set(CMAKE_AR arm-none-eabi-ar)
set(CMAKE_ASM_COMPILER arm-none-eabi-as)
set(CMAKE_LINKER arm-none-eabi-ld)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(CMAKE_RANLIB arm-none-eabi-ranlib)

set(CMAKE_FIND_ROOT_PATH /Applications/ARM)
#set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
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


