# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
