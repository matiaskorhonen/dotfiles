export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

if [[ -d /Applications/Postgres.app/Contents/MacOS/bin ]] then
  export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
elif [[ -d /Applications/Postgres.app/Contents/Versions/9.3/bin ]] then
  export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
elif [[ -d /Applications/Postgres.app/Contents/Versions/9.4/bin ]] then
  export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
elif [[ -d /Applications/Postgres.app/Contents/Versions/9.5/bin ]] then
  export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"
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
