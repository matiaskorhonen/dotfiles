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

if [[ -d /usr/local/share/npm/bin ]] then
  export PATH="/usr/local/share/npm/bin:$PATH"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Google Cloud CLI tools
if [ -f /Users/matt/.gcloud/google-cloud-sdk/completion.zsh.inc ]; then
  source /Users/matt/.gcloud/google-cloud-sdk/path.zsh.inc
  source /Users/matt/.gcloud/google-cloud-sdk/completion.zsh.inc
fi

# GPG Agent stuff
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

# Yarn
if yarn --version > /dev/null 2>&1; then
  export PATH="$PATH:`yarn global bin`"
fi
