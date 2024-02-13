#!/bin/bash
set -e
export MAKEFLAGS=-j3

# Set the default build type
BUILD_TYPE=RelWithDebInfo
colcon build \
        --parallel-workers 8 \
        --merge-install \
        --symlink-install \
        --base-paths "src" \
        --cmake-args "-DCMAKE_BUILD_TYPE=$BUILD_TYPE" "-DCMAKE_EXPORT_COMPILE_COMMANDS=On" \
        -Wall -Wextra -Wpedantic 
