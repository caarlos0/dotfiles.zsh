#!/bin/zsh
export MAVEN_OPTS="-Xmx1024m"
export ECLIPSE_HOME=/opt/homebrew-cask/Caskroom/eclipse-jee/latest/eclipse
if [ -e "$ECLIPSE_HOME"/Eclipse.app ]; then
  export PATH="${ECLIPSE_HOME}/Eclipse.app/Contents/MacOS:${PATH}"
  if /usr/libexec/java_home &>/dev/null; then
    export JAVA_HOME=$(/usr/libexec/java_home)
  fi
else
  unset ECLIPSE_HOME
fi
