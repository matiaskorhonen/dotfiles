# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="matt"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(brew c catimg gem git github iwhois golang heroku osx pod rails rvm urltools)

source $ZSH/oh-my-zsh.sh

# Default editor
export EDITOR="vim"

# Bundler editor (bundle open GEM)
export BUNDLER_EDITOR="atom -w"

# Make JRuby default to 1.9 mode
export JRUBY_OPTS=--1.9

if [ -d "$HOME/Programming/dokku" ]; then
  # Configure the Dokku host
  export DOKKU_HOST="anoia.matias.li"
  # Dokku alias
  alias dokku='$HOME/Programming/dokku/contrib/dokku_client.sh'
fi

# Add the MySQL stuff to PATH (etc) if it is installed
MYSQL="/usr/local/mysql/bin"
if [ -d "$MYSQL" ]; then
    export PATH=$PATH:$MYSQL
    export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
fi

# Add the GOROOT-based install location to your PATH
GOROOT="/usr/local/opt/go/libexec/bin"
if [ -d "$GOROOT" ]; then
  export PATH=$PATH:$GOROOT
  export GOPATH="$HOME/Programming/go"
  export PATH="$PATH:$GOPATH/bin"
fi
