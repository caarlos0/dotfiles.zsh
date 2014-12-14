#!/bin/bash -ex
check() {
  if [ "$(head -n1 $script)" == "*/bin/bash*" ]; then
    shellcheck -s bash "$script"
  elif [ "$(head -n1 $script)" == "*/bin/zsh*" ]; then
    shellcheck -s zsh "$script"
  else
    shellcheck "$script"
  fi
}

find . -name "*.sh" -depth 2 | while read script; do
  check "$script"
done

find . -type f ! -name "*.*" -depth 2 | while read script; do
  [[ "$(head -n1 $script)" == "*sh*" ]] && check "$script"
done
