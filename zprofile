export LC_ALL=en_US.UTF-8

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Add Homebrew bins to the beginning of PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Postgres.app CLI tools
if [[ -d /Applications/Postgres.app/Contents/Versions ]] then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# Google Cloud CLI tools
if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# Android tooling
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
if [[ -d "${ANDROID_SDK_ROOT}" ]] then
  export ANDROID_HOME=${ANDROID_SDK_ROOT}
  export PATH=${PATH}:${ANDROID_HOME}/tools
  export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
  export PATH=${PATH}:${ANDROID_HOME}/platform-tools
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
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# fnm
eval "$(fnm env --use-on-cd)"

# rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init -)"
