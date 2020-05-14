export LC_ALL=en_US.UTF-8

export HOMEBREW_NO_ANALYTICS=1

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Postgres.app CLI tools
if [[ -d /Applications/Postgres.app/Contents/Versions ]] then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Google Cloud CLI tools
if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
if [[ -d "${ANDROID_SDK_ROOT}" ]] then
  export ANDROID_HOME=${ANDROID_SDK_ROOT}
  export PATH=${PATH}:${ANDROID_HOME}/tools
  export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
  export PATH=${PATH}:${ANDROID_HOME}/platform-tools
fi

export GPG_TTY=$(tty)

USER_BASE_PATH=$(python -m site --user-base)
export PATH="$PATH:$USER_BASE_PATH/bin"

# Spring STAAAAHTP
export DISABLE_SPRING="true"
