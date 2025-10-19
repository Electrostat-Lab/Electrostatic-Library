#!/bin/bash

source "./helper-scripts/abstract/abstract-compile.sh"
source "./helper-scripts/abstract/abstract-util.sh"
source "./helper-scripts/project-impl/variables.sh"

cd "${project_root}/${source_dir}" || exit $?

COMMISSION_OUTPUT="${1}"
GCC_BIN="${2}"
GPP_BIN="${3}"
BUILD_STATIC="${4}"
BUILD_SHARED="${5}"
BUILD_EXE="${6}"
COMPILER_OPTIONS="${7}"
TARGET_MACHINE="${8}"
HEADERS="${9}"
CODEBASE_MODULES=("${10}")
DEPENDENCIES_MODULES=("${11}")
BUILTIN_LIBS="${12}"
SOURCE_DIR="${13}"
SYSTEM_DIR="${14}"
BUILD_DIR="${15}"
RUN_POST_COMPILE_SCRIPTS="${16}"
DYNAMIC_LINKING="${17}"

# precompile scripts
sources=$(find ${CODEBASE_MODULES[*]} -name *.c -o -name *.cpp -o -name *.cxx | tr '\n' ';')

if [ "${DEPENDENCIES_MODULES[*]}" != "${NULL}" ]; then
  if [ "${DYNAMIC_LINKING}" == "true" ]; then
    echo -e "--------- Deferring Linking to runtime ---------"
    dependencies=$(find ${DEPENDENCIES_MODULES[*]} -name *.so | tr '\n' ';')
  else
    echo -e "--------- Performing Static Linking ---------"
    dependencies=$(find ${DEPENDENCIES_MODULES[*]} -name *.a -o -name *.ar | tr '\n' ';')
  fi
fi

# compile scripts
compile "${COMMISSION_OUTPUT}" "${GCC_BIN}" "${GPP_BIN}" "${BUILD_STATIC}" "${BUILD_SHARED}" \
        "${BUILD_EXE}" "${COMPILER_OPTIONS}" \
        "${TARGET_MACHINE}" "${HEADERS}" \
        "${SOURCE_DIR}" "${sources}" "${dependencies};${BUILTIN_LIBS}" \
        "${SYSTEM_DIR}/${BUILD_DIR}" "." "${SOURCE_DIR}"

cd ${project_root} || exit $?

if [ "${RUN_POST_COMPILE_SCRIPTS}" == "${POST_COMPILE_TRUE}" ]; then
  # post compile scripts
  ./helper-scripts/project-impl/post-compile/post-compile-electrostatic.sh "${SYSTEM_DIR}" "${BUILD_DIR}" || exit
fi
