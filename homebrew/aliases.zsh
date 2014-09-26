[[ "$(uname -s)" != "Darwin" ]] && exit 0

alias brewcleanup="brew cleanup && brew cask cleanup"
alias brewupgrade="brew update && brew upgrade && brewcleanup"
