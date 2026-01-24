#!/usr/bin/env bash

set -euo pipefail

GUM_VERSION="0.17.0"
export GUM_INPUT_WIDTH="${COLUMNS:-80}"

CWD=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
OMZ_DIR="$HOME/.oh-my-zsh"

DOTFILES=(ackrc gemrc gitattributes gitignore inputrc irbrc pryrc railsrc vimrc vim zlogin zprofile zshrc)

gum_download_url() {
  local OS;
  local ARCH;

  case "$OSTYPE" in
    darwin*)  OS="Darwin" ;;
    linux*)   OS="Linux" ;;
    *)        echo "Unsupported OSTYPE=$OSTYPE"; exit 1 ;;
  esac

  ARCH=$(uname -m)

  echo "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_${OS}_${ARCH}.tar.gz"
}

print_separator() {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

prerequisites() {
  # Check if script is run non-interactively
  if [[ -n "${NONINTERACTIVE-}" ]]
  then
    echo "Running in non-interactive mode because \`\$NONINTERACTIVE\` is set."
  fi

  # Check for Gum (https://github.com/charmbracelet/gum)
  export GUM_PATH
  if ! command -v gum &> /dev/null
  then
    echo "Gum command could not be found"

    if [[ -n "${NONINTERACTIVE-}" ]]
    then
      echo "Fetching Gum because it is not installed"
      REPLY="y"
    else
      read -p "Download and install temporary copy of Gum? " -n 1 -r
      echo
    fi

    if [[ $REPLY =~ ^[Yy]$ ]]; then
      local tmpdir
      local gumarchive

      tmpdir="$(mktemp -d -t gum.XXXXX)"
      gumarchive="$tmpdir/gum_${GUM_VERSION}.tar.gz"

      echo "Downloading gum v${GUM_VERSION} to $gumarchive"
      curl -sLo "$gumarchive" "$(gum_download_url)"

      echo "Extracting gum to $tmpdir"
      tar -xf "$gumarchive" -C "$tmpdir"

      gumdir=$(find "$tmpdir" -mindepth 1 -maxdepth 1 -type d | head -1)
      echo "Adding $gumdir directory to PATH for the duration of this script"
      export PATH="$gumdir:$PATH"

      print_separator

      gum log --structured --level info "Gum is now available ✓"
    else
      echo "Aborting"
      exit 1
    fi
  else
    gum log --structured --level info "Gum is already installed ✓"
  fi

  if [ ! -d "$OMZ_DIR" ]; then
    gum log --structured --level fatal "Oh my Zsh! wasn't found" path "$OMZ_DIR"
    exit 1
  fi
}

function symlink_unless_target_exists() {
  local source=$1
  local target=$2

  if [ -e "$target" ] || [ -L "$target" ]; then
    gum log --structured --level debug "File already exists" target "$target"
  else
    gum log --structured --level debug "Symlinking" source "$source" target "$target"
    ln -s "$source" "$target"
  fi
}

function preamble() {
  gum log --structured --level debug "Source directory" CWD "$CWD"
  gum log --structured --level debug "Home directory" HOME "$HOME"
  gum log --structured --level debug "Oh My Zsh" OMZ "$OMZ_DIR"
}

function symlink_dotfiles() {
  gum log --structured --level info "Symlinking the dotfiles to the right places"

  for dotfile in "${DOTFILES[@]}"; do
    target="$HOME/.$dotfile"
    source="$CWD/$dotfile"
    symlink_unless_target_exists "$source" "$target"
  done
}

function install_starship_config() {
  gum log --structured --level info "Installing Starship config"

  mkdir -p "$HOME/.config"
  symlink_unless_target_exists "$CWD/starship.toml" "$HOME/.config/starship.toml"
}

function install_httpie_config() {
  gum log --structured --level info "Installing HTTPie config"

  mkdir -p "$HOME/.config"
  symlink_unless_target_exists "$CWD/httpie" "$HOME/.config/httpie"
}

function generate_gitconfig() {
  gum log --structured --level info "Generating git config"

  export GIT_USER_NAME
  export GIT_USER_EMAIL
  export GIT_SIGNING_KEY

  GIT_USER_NAME="$(gum input --value "$(git config --get user.name)" --header "Git name" --placeholder "user.name")"
  GIT_USER_EMAIL="$(gum input --value "$(git config --get user.email)" --header "Git email" --placeholder "user.email")"
  GIT_SIGNING_KEY="$(gum input --value "$(git config --get user.signingkey)" --header "Git signingkey" --placeholder "user.signingkey")"

  # We want to control which environment variables envsubst replaces
  # shellcheck disable=SC2016
  envsubst '$GIT_USER_NAME,$GIT_USER_EMAIL,$GIT_SIGNING_KEY' < "$CWD/gitconfig.template"
}

function install_gitconfig() {
  if [[ -n "${NONINTERACTIVE-}" ]]; then
    gum log --structured --level warn "Running in non-interactive mode, skipping gitconfig"
    return
  fi

  if [ -e "$HOME/.gitconfig" ]; then
    gum log --structured --level info "Git config already exists" path "$HOME/.gitconfig"

    if gum confirm --default=false "$HOME/.gitconfig already exists, do you want to overwrite it?"; then
      gum log --structured --level info "Overwriting git config"
    else
      gum log --structured --level info "Skipping gitconfig generation"
      return
    fi
  fi

  generate_gitconfig > "$HOME/.gitconfig"
}

prerequisites
preamble
symlink_dotfiles
install_starship_config
install_httpie_config
install_gitconfig
