#!/bin/bash

source "./helper-scripts/project-impl/variables.sh"

source_module="${lib_src}"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${COMMISSION_LIB}" "${AVR_GCC_BIN}" "${AVR_GPP_BIN}" "ON" "OFF" "OFF" "-O2" \
        "-mmcu=atmega32 -D_ELECTRO_MIO" "${AVR_TOOLCHAIN_INCLUDES};${headers}" "${source_module}" \
		"${libs}/avr-mcu/atmega32" "m" "${source_dir}" \
         "avr-mcu" "atmega32" "${POST_COMPILE_TRUE}" "false"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${COMMISSION_LIB}" "${AVR_GCC_BIN}" "${AVR_GPP_BIN}" "ON" "OFF" "OFF" "-O2" \
        "-mmcu=atmega328p -D_ELECTRO_MIO" "${AVR_TOOLCHAIN_INCLUDES};${headers}" "${source_module}" \
		"${libs}/avr-mcu/atmega328p" "m" "${source_dir}" \
         "avr-mcu" "atmega328p" "${POST_COMPILE_TRUE}" "false"
