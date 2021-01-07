#!/usr/bin/env bash

install_dotfiles() {
  dot="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
  mkdir -p $HOME/.cfg-backup

  if [ ! -d $HOME/.cfg ]
  then
    git clone --bare https://github.com/hex0cter/dotfiles.git $HOME/.cfg

    $dot config --local status.showUntrackedFiles no

    $dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.cfg-backup/{}
    $dot checkout
  else
    $dot pull 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.cfg-backup/{}
    $dot pull
  fi
}

install_zsh() {
  if [ -d $HOME/.oh-my-zsh ]
  then
    cd $HOME/.oh-my-zsh
    git pull
  else
    export RUNZSH=no
    export KEEP_ZSHRC=yes
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
  fi
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
