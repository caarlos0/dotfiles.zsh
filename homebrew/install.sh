#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test "$(uname)" = "Darwin" -a ! "$(which brew)"; then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
test "$(which brew)" && git config \
  --file="$(brew --repository)/.git/config" \
  --replace-all homebrew.analyticsdisabled true
