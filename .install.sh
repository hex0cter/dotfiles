#!/usr/bin/env bash

install_dotfiles() {
  git clone --bare git@github.com:hex0cter/dotfiles.git $HOME/.cfg

  alias dot='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

  mkdir -p .config-backup
  dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
}

install_zsh() {
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

install_linux() {
  sudo apt update
  sudo apt -y install git tmux zsh
  echo "install linux"

  install_dotfiles
  install_zsh
}

install_macos() {
  brew update
  brew install git tmux zsh
  echo "install macos"

  install_dotfiles
  install_zsh
}

os=$(uname)
if [ "$os" == "Linux" ]
then
  install_linux
elif [ "$os" == "Darwin" ]
then
  install_macos
fi
