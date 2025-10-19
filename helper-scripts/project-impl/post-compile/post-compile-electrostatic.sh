#!/bin/bash

source "./helper-scripts/project-impl/variables.sh"

SYSTEM_DIR="${1}"
BUILD_DIR="${2}"

# prepare dependencies directories
mkdir -p "$(pwd)/${source_dir}/build/${SYSTEM_DIR}/${BUILD_DIR}"

cp -r --update "$(pwd)/${source_dir}/cmake-build/${SYSTEM_DIR}/${BUILD_DIR}/lib${COMMISSION_LIB}.so" \
   			   "$(pwd)/${source_dir}/build/${SYSTEM_DIR}/${BUILD_DIR}"


cp -r --update "$(pwd)/${source_dir}/cmake-build/${SYSTEM_DIR}/${BUILD_DIR}/lib${COMMISSION_LIB_AR}.a" \
   			   "$(pwd)/${source_dir}/build/${SYSTEM_DIR}/${BUILD_DIR}"
