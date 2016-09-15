# Start a Rails server
unalias rs 2>/dev/null
function rs() {
  if [ -f "./bin/rails" ]
  then
    ./bin/rails server $@
  else
    rails server $@
  fi
}
