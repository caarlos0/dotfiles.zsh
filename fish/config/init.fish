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
# nodejs
#
alias npis='npm install --save'
alias npisd='npm install --save-dev'
alias npig='npm install -g'
alias npit='npm init'
alias npi='npm install'

#
# postgres
#
# test -e "/Applications/Postgres.app" and \
#   set -gx PATH $PATH /Applications/Postgres.app/Contents/Versions/9.5/bin/

#
# kubernetes
#
# function kx -d "kubernetes context"
#   test -n "$argv" && kubectl config use-context "$argv"
#   test -z "$argv" && kubectl config get-contexts
# end

alias k='kubectl'
alias sk='kubectl -n kube-system'

#
# ruby
#
alias migrate='rake db:migrate'
alias fs='bundle exec foreman start'
alias fsdev='bundle exec foreman start -f Procfile.dev'

#
# ssh
#
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

#
# system
#
switch (uname -s)
case Darwin
  alias ls="ls -FG"
case *
  alias ls="ls -F --color"
end
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"
alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"

# quick hack to make watch work with aliases
# alias watch='watch '

# if [ "$(uname -s)" != "Darwin" ]; then
#   if [ -z "$(command -v pbcopy)" ]; then
#     if [ -n "$(command -v xclip)" ]; then
#       alias pbcopy="xclip -selection clipboard"
#       alias pbpaste="xclip -selection clipboard -o"
#     elif [ -n "$(command -v xsel)" ]; then
#       alias pbcopy="xsel --clipboard --input"
#       alias pbpaste="xsel --clipboard --output"
#     fi
#   fi
#   if [ -e /usr/bin/xdg-open ]; then
#     alias open="xdg-open"
#   fi
# fi

# greps non ascii chars
function nonascii -d "show non ASCII chars"
  LANG=C grep --color=always '[^ -~]\+';
end
