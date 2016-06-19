# Download the given URLs or PIDs to the ~/Downloads folder
function iplayer() {
  if [ -z "$1" ]
  then
    echo "Usage: iplayer URL ..."
    exit 1
  fi

  for var in "$@"
  do
    get_iplayer --modes=best --output=$HOME/Downloads "$var"
  done
}
