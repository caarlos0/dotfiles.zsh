if $(brew &>/dev/null)
then
  alias brewcleanup="brew cleanup && brew cask cleanup"
  alias brewupgrade="brew update && brew upgrade && brewcleanup"
fi
