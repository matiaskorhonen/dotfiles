export HOMEBREW_NO_ANALYTICS=1

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Postgres.app CLI tools
if [[ -d /Applications/Postgres.app/Contents/Versions ]] then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# Amazon CLI tools configuration
export JAVA_HOME="$(/usr/libexec/java_home)"
export AWS_IAM_HOME="/usr/local/opt/aws-iam-tools/jars"
export AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master

if [ -f $HOME/.ec2/ ]; then
  export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
  export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
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

# qt (for capybara-webkit)
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
