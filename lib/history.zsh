# Increase history size
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
setopt inc_append_history # Write to the history file immediately, not when the shell exits.
setopt hist_ignore_dups   # Don't record an entry that was just recorded again.
setopt hist_ignore_space  # Don't record an entry starting with a space.
setopt share_history      # Share history between all sessions.
