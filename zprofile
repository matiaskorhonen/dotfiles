export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

if [[ -d /Applications/Postgres.app ]] then
  export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
