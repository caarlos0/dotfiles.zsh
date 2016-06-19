#!/bin/sh

mvn() {
  # shellcheck disable=SC2068
  command mvn $@
  message="'mvn $*' done!"
  which terminal-notifier > /dev/null && terminal-notifier -message "$message"
  which notify-send > /dev/null && notify-send "$message"
}

alias mvnci='mvn clean install'
alias mvnc='mvn clean'
alias mvnt='mvn test'
alias mvnag='mvn archetype:generate'
alias mvnnew='mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart'

killjboss() {
  pkill -9 -f jboss-modules
}
