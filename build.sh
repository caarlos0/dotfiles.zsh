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

check "./build.sh"

find .  -maxdepth 2 -type f -name "*.*sh" | while read script; do
  check "$script"
done

find . -maxdepth 2 -type f ! -name "*.*" | egrep -v ".git" | while read script; do
  head=$(head -n1 "$script")
  [[ "$head" = "#!/usr/bin/env ruby" ]] && continue
  [[ "$head" =~ ^#compdef.* ]] &&  continue
  [[ "$script" =~ .*.MD ]] && continue
  check "$script"
done
