if [ "$(uname -s)" != "Darwin" ]; then
  completion=/usr/local/etc/bash_completion.d/go-completion.bash
else
  completion='$(brew --prefix)/share/zsh/functions/_go'
fi

if test -f $completion; then
  source $completion
fi
