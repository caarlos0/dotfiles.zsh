#!/bin/zsh
# Force rehash when command not found
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1
}

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _match _ignored _approximate

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# menu if nb items > 2
zstyle ':completion:*' menu select=2
