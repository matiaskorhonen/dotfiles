# Initialize Starship prompt
eval "$(starship init zsh)"

# Default editor
export EDITOR="vim"

# Bundler editor (bundle open GEM)
export BUNDLER_EDITOR="code"

# Add the GOROOT-based install location to your PATH
GOROOT="/usr/local/opt/go/libexec/bin"
if [ -d "$GOROOT" ]; then
  export PATH=$PATH:$GOROOT
  export GOPATH="$HOME/Code/go"
  export PATH="$PATH:$GOPATH/bin"
fi

# To make Homebrew’s completions available in zsh, you must insert the
# Homebrew-managed zsh/site-functions path into your FPATH before initialising
# zsh’s completion facility.
#
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

source "$HOME/.dotfiles/plugins/c/c.plugin.zsh"
source "$HOME/.dotfiles/plugins/until-fail/until-fail.plugin.zsh"
source "$HOME/.dotfiles/plugins/iterm2-ssh/iterm2-ssh.plugin.zsh"
source "$HOME/.dotfiles/plugins/rails-custom/rails-custom.plugin.zsh"
source "$HOME/.dotfiles/plugins/aliases.zsh"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
