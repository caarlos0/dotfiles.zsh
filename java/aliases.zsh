#!/bin/sh

alias mvnci='mvn clean install'
alias mvnc='mvn clean'
alias mvnt='mvn test'
alias mvnag='mvn archetype:generate'
alias mvnnew='mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart'

killjboss() {
	pkill -9 -f jboss-modules
}
