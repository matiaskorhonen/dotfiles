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
plugins=(brew c catimg gem iplayer iwhois github golang heroku osx pod rails rs rvm urltools)

source $ZSH/oh-my-zsh.sh

# Default editor
export EDITOR="vim"

# Bundler editor (bundle open GEM)
export BUNDLER_EDITOR="atom"

# Make JRuby default to 1.9 mode
export JRUBY_OPTS=--1.9

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
  export GOPATH="$HOME/Code/go"
  export PATH="$PATH:$GOPATH/bin"
fi

# AWS CLI completion
AWS_COMPLETION="/usr/local/share/zsh/site-functions/_aws"
if [ -f "$AWS_COMPLETION" ]; then
  source "$AWS_COMPLETION"
fi

# Add Yarn to PATH if it's installed
if [ -d "$HOME/.yarn/bin" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

if [ -d "/usr/local/share/zsh/help" ]; then
  unalias run-help
  autoload run-help
  HELPDIR=/usr/local/share/zsh/help
fi

# Homebrew installs zsh completion definitions to
#  /usr/local/share/zsh/site-functions, which on $FPATH for the
# Homebrew-installed zsh, but not for the system zsh.
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
