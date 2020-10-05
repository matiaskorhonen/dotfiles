function _gitroot() {
  (cd "$(dirname '$1')" &> /dev/null && git rev-parse --show-toplevel 2> /dev/null)
}

unalias tower 2>/dev/null
function tower() {
  if [[ $1 == -* ]]; then
    gittower $@
  else
    local gitroot=$(_gitroot $1)
    if [ -z "${gitroot}" ]; then
      gittower $@
    else
      gittower $gitroot
    fi
  fi
}
