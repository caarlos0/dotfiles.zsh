# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
