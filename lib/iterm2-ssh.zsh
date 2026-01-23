function _tab-reset-trap() {
  trap - INT
}

function _tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  # if you have trouble with this, change
  # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

function _tab-reset() {
  NAME="Default"
  echo -e "\033]50;SetProfile=$NAME\a"
}

function ssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "_tab-reset" INT EXIT
    _tab-reset-trap
    _tabc SSH

    # Use an if like this to change the profile based on the hostname
    #
    # if [[ "$*" =~ "production*" ]]; then
    #     _tabc Production
    # elif [[ "$*" =~ "staging*" ]]; then
    #     _tabc Staging
    # else
    #     _tabc SSH
    # fi
  fi
  command ssh "$@"
}

function heroku() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    if [[ "$@" =~ "console*" || "$@" =~ "run bash*" ]]; then
      trap "_tab-reset" INT EXIT
      _tab-reset-trap
      _tabc Heroku
    fi
  fi
  command heroku "$@"
}
