#!/bin/zsh
if test "$(which terminal-notifier)"; then
  mvn() {
    # shellcheck disable=SC2068
    command mvn $@
    terminal-notifier -message "'mvn $*' done!"
  }
fi

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
