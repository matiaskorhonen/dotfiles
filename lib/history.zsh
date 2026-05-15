# Increase history size
[ "$HISTSIZE" -lt 50000 ] && export HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && export SAVEHIST=10000

setopt inc_append_history # Write to the history file immediately, not when the shell exits.
setopt hist_ignore_dups   # Don't record an entry that was just recorded again.
setopt hist_ignore_space  # Don't record an entry starting with a space.
setopt share_history      # Share history between all sessions.

# History wrapper — adapted from Oh My Zsh
# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh
function _history {
  if [[ $# -eq 0 ]]; then
    # Show full history when called with no arguments (default shows only 16)
    builtin fc -l 1
  else
    builtin fc -l "$@"
  fi
}
alias history='_history'
