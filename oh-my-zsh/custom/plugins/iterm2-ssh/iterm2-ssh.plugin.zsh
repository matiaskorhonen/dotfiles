function tab_reset_trap {
  trap - INT
}

function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  # if you have trouble with this, change
  # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

function tab-reset() {
  NAME="Default"
  echo -e "\033]50;SetProfile=$NAME\a"
}

function ssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "tab-reset" INT EXIT
    tab_reset_trap
    tabc SSH

    # Use an if like this to change the profile based on the hostname
    #
    # if [[ "$*" =~ "production*" ]]; then
    #     tabc Production
    # elif [[ "$*" =~ "staging*" ]]; then
    #     tabc Staging
    # else
    #     tabc SSH
    # fi
  fi
  command ssh "$@"
}

function heroku() {
  if [[ "$@" =~ "console*" || "$@" =~ "run bash*" ]]; then
    trap "tab-reset" INT EXIT
    tab_reset_trap
    tabc Heroku
  fi
  command heroku "$@"
}
