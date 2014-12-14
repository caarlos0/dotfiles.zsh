export MAVEN_OPTS="-Xmx1024m"

if [ -e /opt/homebrew-cask/Caskroom/eclipse-jee/latest/eclipse/Eclipse.app ]
then
  export ECLIPSE_HOME=/opt/homebrew-cask/Caskroom/eclipse-jee/latest/eclipse
  export PATH="${ECLIPSE_HOME}/Eclipse.app/Contents/MacOS:${PATH}"
  if /usr/libexec/java_home &>/dev/null; then
    export JAVA_HOME=$(/usr/libexec/java_home)
  fi
fi
