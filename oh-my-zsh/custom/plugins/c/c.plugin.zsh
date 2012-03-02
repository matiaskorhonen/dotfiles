function c() {
   cd ~/Programming/$1;
}

#compdef c
function _c () {
  _files -W ~/Programming -/
}

compdef _c c