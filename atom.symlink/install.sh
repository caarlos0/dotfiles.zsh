#!/bin/sh
if test "$(which apm)"; then
	apm upgrade --confirm false

	modules="
    atom-beautify
    atom-wrap-in-tag
    color-picker
    editorconfig
    file-icons
    go-plus
    go-rename
    language-diff
    language-docker
    language-puppet
    language-terraform
    linter
    linter-jshint
    linter-ruby
    sort-lines
    wakatime
  "
	for module in $modules; do
		if test ! -d "$HOME/.atom/packages/$module"; then
			apm install "$module"
		fi
	done

	modules="
    metrics
    exception-reporting
  "
	for module in $modules; do
		if test -d "$HOME/.atom/packages/$module"; then
			apm remove "$module"
		fi
	done
fi
