export LC_ALL=en_US.UTF-8

# Postgres.app CLI tools
if [[ -d /Applications/Postgres.app/Contents/Versions ]] then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# Android tooling
export ANDROID_SDK="$HOME/Library/Android/sdk"
if [[ -d "$ANDROID_SDK" ]] then
  export ANDROID_HOME="$ANDROID_SDK"
  export PATH="$PATH:$ANDROID_HOME/tools"
  export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
fi

# Configure GPG
export GPG_TTY=$(tty)

# Add Python scripts to the path
USER_BASE_PATH=$(python3 -m site --user-base)
export PATH="$PATH:$USER_BASE_PATH/bin"

# Spring STAAAAHTP
export DISABLE_SPRING="true"

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Homebrew
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# fnm
eval "$(fnm env --use-on-cd)"

# rbenv
eval "$(rbenv init -)"

# Cargo binaries
if [[ -d "$HOME/.cargo/bin" ]] then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# rustup
if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi
