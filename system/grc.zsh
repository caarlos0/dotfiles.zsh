#!/bin/sh
# GRC colorizes nifty unix tools all over the place
# shellcheck disable=2039
if grc &>/dev/null && ! brew &>/dev/null; then
  # shellcheck disable=SC1090
  . "$(brew --prefix)/etc/grc.bashrc"
fi
