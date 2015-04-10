#!/bin/zsh
# aliases

if test "$(which terminal-notifier)"; then
  mvn() {
    command mvn $*
    terminal-notifier -message "Maven is done."
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

function listMavenCompletions {
	reply=(
		cli:execute cli:execute-phase archetype:generate generate-sources compile \
    clean install test test-compile deploy package cobertura:cobertura \
    jetty:run gwt:run gwt:debug -DskipTests -Dmaven.test.skip=true \
    -DarchetypeCatalog=http://tapestry.formos.com/maven-snapshot-repository \
    -Dtest=$(if [ -d ./src ] ; then find ./src -type f | grep -v svn | sed 's?.*/\([^/]*\)\..*?-Dtest=\1?'; fi));
}

compctl -K listMavenCompletions mvn
