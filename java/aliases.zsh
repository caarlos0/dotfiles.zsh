#!/bin/sh

mvn() {
  # shellcheck disable=SC2068
  command mvn $@
  message="'mvn $*' done!"
  which terminal-notifier > /dev/null && terminal-notifier -message "$message"
  which notify-send > /dev/null && notify-send "$message"
}

alias mvncie='mvn clean install eclipse:eclipse'
alias mvnci='mvn clean install'
alias mvne='mvn eclipse:eclipse'
alias mvnce='mvn clean eclipse:clean eclipse:eclipse'
alias mvnd='mvn deploy'
alias mvnp='mvn package'
alias mvnc='mvn clean'
alias mvncom='mvn compile'
alias mvnt='mvn test'
alias mvnag='mvn archetype:generate'
alias mvnnew='mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart'

killjboss() {
  pgrep -f jboss-modules | xargs kill -9
}
