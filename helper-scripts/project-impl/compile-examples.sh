#!/bin/bash

source "./helper-scripts/abstract/abstract-compile.sh"
source "./helper-scripts/project-impl/variables.sh"

TARGET_MACHINE="${1}"
EXAMPLE="${2}"
EXECUTABLE="${3}"
SYSTEM_DIR="${4}"
LIB_ARCH="${5}"
BUILD_DIR="${6}"

sources="$(pwd)/${examples_dir}/${EXAMPLE}"
libelectrostatic_module="${libs}/${SYSTEM_DIR}/${LIB_ARCH}"
libelectroextension_module="$(pwd)/build/${SYSTEM_DIR}/${LIB_ARCH}"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${EXECUTABLE}" "${GCC_BIN_x86}" "${GPP_BIN_x86}" "OFF" "OFF" "ON" "${INPUT_COMPILER_OPTIONS}" \
        "${TARGET_MACHINE}" "${TOOLCHAIN_INCLUDES_x86};${headers}" "${sources}" \
		"${libelectrostatic_module} ${libelectroextension_module}" "m;pthread;dl" "${source_dir}" \
         "${SYSTEM_DIR}" "${BUILD_DIR}" "${POST_COMPILE_FALSE}" "false"

cd "${project_root}" || exit $?


