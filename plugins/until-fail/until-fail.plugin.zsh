# Retry a command until it fails
#
# Based on: https://gist.github.com/tombruijn/0cde5de10e86d91717ed855623929b05
#
# Usage:
#
#   $ until-fail true
#   # Will repeat forever
#
#   $ until-fail false
#   # Fails at the first iteration and breaks out of the retry loop
#
#   $ until-fail ruby -e "rand(0..1) == 1 ? (puts 'failed'; exit(1)) : (puts 'success')"
#   # Fails randomly and breaks out of the retry loop when it fails
until-fail(){
  if [[ -z "$*" ]]; then
    echo "ERROR: No command given to retry"
    break
  fi

  i=0
  while true; do
    echo "Retry #$i: $*"
    echo

    # Run command and exit only if it fails
    "$@"
    exitcode=$?

    if [ $exitcode -ne 0 ]; then
      echo "ERROR: Failure on retry #$i [Exit code $exitcode]"
      break
    else
      i=$((i + 1))

      printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
      echo
    fi
  done

  return $exitcode
}
