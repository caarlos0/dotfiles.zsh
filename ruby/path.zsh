if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi
if $(rbenv &>/dev/null)
then
  eval "$(rbenv init -)"
fi
