#!/usr/bin/env bash

install_dotfiles() {
  dot="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

  if [ ! -d $HOME/.cfg ]
  then
    git clone --bare https://github.com/hex0cter/dotfiles.git $HOME/.cfg

    $dot config --local status.showUntrackedFiles no
    $dot checkout --force
  else
    $dot restore --staged .
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

  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

  latest=$(pyenv install --list | grep -v dev | grep "^ *3." | tail -1 | sed -e 's/ //g')
  pyenv install ${latest} || true
  pyenv global ${latest}
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
  if [ ! -d ~/.autojump ]
  then
    git clone git://github.com/wting/autojump.git ~/.autojump
  fi

  echo $PATH
  cd ~/.autojump && sudo $(which python) ./install.py --dest /usr/local && cd
}

install_pistol() {
  sudo apt install -y libmagic-dev
  env GO111MODULE=on go get -u github.com/doronbehar/pistol/cmd/pistol
}

install_if() {
  env CGO_ENABLED=0 GO111MODULE=on go get -u -ldflags="-s -w" github.com/gokcehan/lf
}

install_imgcat() {
  pip install imgcat
}

install_nvm() {
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  cd ~/.nvm && . ./nvm.sh && cd -
  nvm install node # "node" is an alias for the latest version
  nvm use node
}

install_yarn() {
  npm install --global yarn
}

install_trash() {
  npm install --global trash-cli
}

config_tmux() {
  if [ ! -d ~/.tmux/plugins/tpm ]
  then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  ~/.tmux/plugins/tpm/bin/install_plugins
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
  sudo apt -y install \
    build-essential \
    git \
    tmux \
    zsh \
    golang \
    fd-find \
    tree \
    bat \
    libssl-dev \
    libffi-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    zlib1g-dev \
    highlight \
    unrar \
    mediainfo \
    ncdu \
    curl

  [ ! -x /usr/bin/bat ] && sudo ln -s /usr/bin/batcat /usr/bin/bat

  install_dotfiles

  install_pyenv
  install_fzf
  install_autojump
  install_pistol
  install_if
  install_nvm
  install_trash
  install_yarn
  install_imgcat

  install_zsh

  config_tmux
}

install_macos() {
  brew update
  brew install coreutils git tmux zsh go pyenv fzf autojump bat

  install_dotfiles

  install_zsh

  config_tmux
}

os=$(uname)
if [ "$os" == "Linux" ]
then
  install_linux
elif [ "$os" == "Darwin" ]
then
  install_macos
fi

echo "🎉 Now you can restart your terminal or just run 'zsh' below. 🌈🌈"
