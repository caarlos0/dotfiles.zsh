#!/bin/sh
test -L ~/.ssh/config || {
  mv ~/.ssh/config{,_custom}
  ln -s $DOTFILES/ssh/config ~/.ssh/config
}
test -f ~/.ssh/config_custom || touch ~/.ssh/config_custom
