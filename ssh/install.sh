#!/bin/sh
test -L ~/.ssh/config || {
  mv ~/.ssh/config{,.local}
  ln -s $DOTFILES/ssh/config ~/.ssh/config
}
test -f ~/.ssh/config.local || touch ~/.ssh/config.local
