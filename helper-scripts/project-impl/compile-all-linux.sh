#!/bin/bash

source "./helper-scripts/project-impl/variables.sh"

source_module="${lib_src}"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${COMMISSION_LIB}" "${GCC_BIN_x86}" "${GPP_BIN_x86}" "ON" "ON" "OFF" "-O3 -fPIC" \
        "${TARGET_x86_64}" "${TOOLCHAIN_INCLUDES_x86};${headers}" "${source_module}" \
		"${libs}/linux/x86-64" "m;pthread;dl" "${source_dir}" \
         "linux" "${x86_64}" "${POST_COMPILE_TRUE}" "false"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${COMMISSION_LIB}" "${GCC_BIN_x86}" "${GPP_BIN_x86}" "ON" "ON" "OFF" "-O3 -fPIC" \
        "${TARGET_x86}" "${TOOLCHAIN_INCLUDES_x86};${headers}" "${source_module}" \
		"${libs}/linux/x86" "m;pthread;dl" "${source_dir}" \
         "linux" "${x86}" "${POST_COMPILE_TRUE}" "false"


