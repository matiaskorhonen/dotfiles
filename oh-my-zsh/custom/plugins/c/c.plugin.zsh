function c() {
  cd ~/Code/$1;
}

function _c () {
  _files -W ~/Code -/
}

function h() {
  cd ~/$1;
}

function _h () {
  _files -W ~ -/
}

function w() {
  cd ~/Code/work/$1;
}

function _w () {
  _files -W ~/Code/work -/
}

compdef _h h
compdef _c c
compdef _w w
