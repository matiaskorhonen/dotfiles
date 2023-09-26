# Use TouchID for sudo on modern MacBook Pro machines (>= macOS Sonoma)
#
# See: https://sixcolors.com/post/2023/08/in-macos-sonoma-touch-id-for-sudo-can-survive-updates/

unalias enable_touchid_sudo 2>/dev/null
function enable_touchid_sudo() {
  sudo bash -eu <<'EOF'
  cd /etc/pam.d
  sed "s/#auth/auth/g" sudo_local.template > sudo_local
EOF
}
