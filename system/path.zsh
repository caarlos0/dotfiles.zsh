export PATH="./bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:$HOME/.sfs:$ZSH/bin:$PATH"

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

if [ -e /Applications/Postgres.app ]
then
  export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
fi

if $(/usr/libexec/java_home &>/dev/null)
then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
