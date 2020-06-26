set PURE_PROMPT_SYMBOL λ

set EDITOR vim
set VEDITOR code

set DOTFILES ~/.dotfiles
set PROJECTS ~/Code
set GOPATH $PROJECTS/Go
set PATH $PATH $GOPATH/bin

set MAVEN_OPTS -Xmx1024m

set PATH $HOME/.krew/bin $PATH

set PATH $PATH $DOTFILES/bin $HOME/.bin

if test -f ~/.localrc.fish
	source ~/.localrc.fish
end
