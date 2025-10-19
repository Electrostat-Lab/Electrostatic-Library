#!/bin/bash

source "./helper-scripts/project-impl/variables.sh"

./helper-scripts/project-impl/compile-all-linux.sh
./helper-scripts/project-impl/compile-all-android.sh
./helper-scripts/project-impl/compile-all-mcu.sh


