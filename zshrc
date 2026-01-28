# Initialize Starship prompt
eval "$(starship init zsh)"

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

# Load iTerm2 shell integration if on macOS and in iTerm2
if [[ "$OSTYPE" == darwin* ]] && [[ -n "$ITERM_SESSION_ID" ]] ; then
  source "$HOME/.dotfiles/lib/iterm2-shell-integration.zsh"
fi

source "$HOME/.dotfiles/lib/aliases.zsh"
source "$HOME/.dotfiles/lib/c.zsh"
source "$HOME/.dotfiles/lib/iterm2-ssh.zsh"
source "$HOME/.dotfiles/lib/keybindings.zsh"
source "$HOME/.dotfiles/lib/rails-custom.zsh"
source "$HOME/.dotfiles/lib/until-fail.zsh"
source "$HOME/.dotfiles/lib/window-title.zsh"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
