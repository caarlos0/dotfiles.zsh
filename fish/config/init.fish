#
# common env
#
set -gx DOTFILES ~/.dotfiles
set -gx PROJECTS ~/Code
set -gx PATH $PATH $DOTFILES/bin
set -gx EDITOR vim
set -gx VEDITOR code

#
# docker
#
alias d='docker'

#
# git
#
alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gcl='git clone'
alias gcb='git-copy-branch-name'
alias gpr='gp; git pr'

function gi -d "gitignore for given languages"
  curl -s "https://www.gitignore.io/api/$argv";
end

#
# golang
#
set -gx GOPATH "$PROJECTS/Go"
set -gx PATH $PATH $GOPATH/bin
# alias gotest='go test -covermode=count -coverprofile=coverage.out'
# alias gocover='gotest && go tool cover -html=coverage.out'

#
# homebrew
#


#
# java
#
set -gx MAVEN_OPTS -Xmx1024m
alias mvnci='mvn clean install'
alias mvnc='mvn clean'
alias mvnt='mvn test'
alias mvnag='mvn archetype:generate'
alias mvnnew='mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart'

function killjboss -d "kills any jboss running"
  pkill -9 -f jboss-modules
end

#
# kubernetes
#
# function kx -d "kubernetes context"
#   test -n "$argv" && kubectl config use-context "$argv"
#   test -z "$argv" && kubectl config get-contexts
# end

alias k='kubectl'
alias sk='kubectl -n kube-system'



