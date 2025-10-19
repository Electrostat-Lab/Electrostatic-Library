#!/bin/bash
source "./helper-scripts/project-impl/variables.sh"

source_module="${lib_src}"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${COMMISSION_LIB}" "${CLANG_BIN}" "${CLANGPP_BIN}" "ON" "ON" "OFF" "-O3 -fPIC" \
        "--target=${ARM_64}" \
        "${NDK_TOOLCHAIN_INCLUDES};${headers}" "${source_module}"  \
		"${libs}/android/${ARM_64}" "m;c;dl" "${source_dir}" \
		"android" "${ARM_64}" "${POST_COMPILE_TRUE}" "false"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${COMMISSION_LIB}" "${CLANG_BIN}" "${CLANGPP_BIN}" "ON" "ON" "OFF" "-O3 -fPIC" \
        "--target=${ARM_32}" \
        "${NDK_TOOLCHAIN_INCLUDES};${headers}" "${source_module}"  \
		"${libs}/android/${ARM_32}" "m;c;dl" "${source_dir}" \
		"android" "${ARM_32}" "${POST_COMPILE_TRUE}" "false"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${COMMISSION_LIB}" "${CLANG_BIN}" "${CLANGPP_BIN}" "ON" "ON" "OFF" "-O3 -fPIC" \
        "--target=${ANDROID_x86}" \
        "${NDK_TOOLCHAIN_INCLUDES};${headers}" "${source_module}"  \
		"${libs}/android/${ANDROID_x86}" "m;c;dl" "${source_dir}" \
		"android" "${ANDROID_x86}" "${POST_COMPILE_TRUE}" "false"

./helper-scripts/project-impl/compile-electrostatic.sh \
        "${COMMISSION_LIB}" "${CLANG_BIN}" "${CLANGPP_BIN}" "ON" "ON" "OFF" "-O3 -fPIC" \
        "--target=${ANDROID_x86_64}" \
        "${NDK_TOOLCHAIN_INCLUDES};${headers}" "${source_module}"  \
		"${libs}/android/${ANDROID_x86_64}" "m;c;dl" "${source_dir}" \
		"android" "${ANDROID_x86_64}" "${POST_COMPILE_TRUE}" "false"
