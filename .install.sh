#!/usr/bin/env bash

install_dotfiles() {
  dot="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
  mkdir -p $HOME/.cfg-backup

  if [ ! -d $HOME/.cfg ]
  then
    git clone --bare https://github.com/hex0cter/dotfiles.git $HOME/.cfg

    $dot config --local status.showUntrackedFiles no

    $dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.cfg-backup/{}
    $dot checkout .
  else
    $dot pull 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.cfg-backup/{}
    $dot checkout .
    $dot pull
  fi
}

install_pyenv() {
  if [ -d ~/.pyenv ]
  then
    cd ~/.pyenv && git pull && cd
  else
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  fi
}

install_fzf() {
  if [ -d ~/.fzf ]
  then
    cd ~/.fzf && git pull && cd
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  fi
  ~/.fzf/install
}

install_autojump() {
  if [ -d ~/.autojump ]
  then
    cd ~/.autojump && git pull && cd
  else
    git clone git://github.com/wting/autojump.git ~/.autojump
    cd ~/.autojump && sudo ./install.py --dest /usr/local && cd
  fi
}

install_pistol() {
  sudo apt install -y libmagic-dev
  env GO111MODULE=on go get -u github.com/doronbehar/pistol/cmd/pistol
}

install_nvm() {
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  cd ~/.nvm && . ./nvm.sh && cd -
  nvm install node # "node" is an alias for the latest version
  nvm use node
}

install_trash() {
  npm install --global trash
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
  sudo apt -y install git tmux zsh golang python-is-python2 python3 fd-find tree

  install_dotfiles
  install_zsh

  install_pyenv
  install_fzf
  install_autojump
  install_pistol
  install_nvm
  install_trash
}

install_macos() {
  brew update
  brew install git tmux zsh go pyenv fzf autojump

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
