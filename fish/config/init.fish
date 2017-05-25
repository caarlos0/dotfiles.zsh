#
# common env
#
set -gx DOTFILES ~/.dotfiles
set -gx PATH $PATH $DOTFILES/bin
set -gx PROJECTS ~/Code
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

#
# homebrew
#
 if which brew >/dev/null 2>&1
  function brew
    switch $argv[1]
    case cleanup
      fish -c '
        cd (brew --repo)
        git prune
        git gc
      '
      command brew cleanup --force
      command brew cask cleanup --force
      command brew prune
      rm -rf (brew --cache)
    case bump
      command brew update
      command brew upgrade
      brew cleanup
    case *
      command brew $argv
    end
  end
end

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
# kubernetes
#
function kx -d "kubernetes context"
  if test -n "$argv"
    kubectl config use-context "$argv"
  else
    kubectl config get-contexts
  end
end

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
if test (uname -s) = "Darwin"
  alias ls="ls -FG"
else
  alias ls="ls -F --color"
  if which xclip > /dev/null 2>&1
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"
  else if which sel > /dev/null 2>&1
    alias pbcopy="xsel --clipboard --input"
    alias pbpaste="xsel --clipboard --output"
  end
  if which xdg-open > /dev/null 2>&1
     alias open="xdg-open"
  end
end

alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"
alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"

# greps non ascii chars
function nonascii -d "show non ASCII chars"
  LANG=C grep --color=always '[^ -~]\+';
end
