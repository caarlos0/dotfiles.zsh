#!/bin/zsh
[ "$(uname -s)" != "Darwin" ] && return 0

# install some java stuff
brew install maven
brew cask install eclipse-jee

BINARY="$(brew cask info eclipse-jee | grep opt | cut -f1 -d' ')/eclipse/Eclipse.app/Contents/MacOS/eclipse"

if [ ! -z "$BINARY" ]; then
  "$BINARY" \
    -application org.eclipse.equinox.p2.director \
    -noSplash \
    -repository http://update.eclemma.org/ \
    -installIUs com.mountainminds.eclemma.feature.feature.group
fi
