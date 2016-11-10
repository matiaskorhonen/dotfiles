# Download the given URLs or PIDs to the ~/Downloads folder
function iplayer() {
  if [ -z "$1" ]
  then
    echo "Usage: iplayer URL ..."
  fi

  for var in "$@"
  do
    get_iplayer --output=$HOME/Downloads "$var"
  done
}
