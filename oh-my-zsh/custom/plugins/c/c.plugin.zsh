function c() {
   cd ~/Code/$1;
}

#compdef c
function _c () {
  _files -W ~/Code -/
}

function h() {
   cd ~/$1;
}

#compdef h
function _h () {
  _files -W ~ -/
}

compdef _h h
compdef _c c
