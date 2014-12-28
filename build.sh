#!/usr/bin/env bash
set -eo pipefail
source ./build/build.sh

check "./zsh/zshrc.symlink"
check_all_executables
