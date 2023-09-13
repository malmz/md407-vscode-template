cmake_minimum_required(VERSION 3.22)
project(
  libstm
  VERSION 1.0
  LANGUAGES C
)

set(libstm_dir ${CMAKE_CURRENT_SOURCE_DIR}/STM32F4_lib)

set(src_dir ${libstm_dir}/STM32F4xx_StdPeriph_Driver/src)

# Add more files here as needed
# These should be fine for the project
add_library(
  libstm
  STATIC
  ${src_dir}/stm32f4xx_can.c
  ${src_dir}/stm32f4xx_rcc.c
  ${src_dir}/stm32f4xx_gpio.c
  ${src_dir}/stm32f4xx_usart.c
  ${src_dir}/stm32f4xx_syscfg.c
  ${src_dir}/stm32f4xx_rng.c
  ${src_dir}/stm32f4xx_tim.c
  ${src_dir}/misc.c
)

target_include_directories(
  libstm
  PUBLIC
  ${libstm_dir}/STM32F4xx_StdPeriph_Driver/inc
  ${libstm_dir}/CMSIS/Include
)