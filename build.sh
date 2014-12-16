#!/bin/bash -e
success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] Linting %s...\n" "$1"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] Linting %s...\n" "$1"
  exit 1
}

check() {
  local script="$1"
  shellcheck -e SC2001 "$script" || fail "$script"
  success "$script"
}

check_shs() {
  find .  -maxdepth 2 -type f -name "*.*sh" | while read script; do
    check "$script"
  done
}

check_no_ext() {
  find . -maxdepth 2 -type f ! -name "*.*" | grep -v ".git" | \
    while read script; do
    head=$(head -n1 "$script")
    [[ "$head" = "#!/usr/bin/env ruby" ]] && continue
    [[ "$head" =~ ^#compdef.* ]] && continue
    check "$script"
  done
}

main() {
  check "./build.sh"
  check "./zsh/zshrc.symlink"
  check_shs
  check_no_ext
}

[[ "$DEBUG" = "1" ]] && set -x

main
