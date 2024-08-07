#!/usr/bin/env bash
set -e

dot() {
  git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

install_dotfiles() {
  if [ ! -d $HOME/.cfg ]
  then
    git clone --bare https://github.com/hex0cter/dotfiles.git $HOME/.cfg

    dot config --local status.showUntrackedFiles no
    dot checkout --force
  else
    dot restore --staged .
    dot checkout .
    dot pull
  fi
}

install_pyenv() {
  echo "::: Installing pyenv :::"

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
  echo "::: Installing fzf :::"

  if [ -d ~/.fzf ]
  then
    cd ~/.fzf && git pull && cd
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  fi
  ~/.fzf/install
}

install_pistol() {
  echo "::: Installing pistol :::"
  go install github.com/doronbehar/pistol/cmd/pistol@latest
}

install_if() {
  echo "::: Installing if :::"
  go install -ldflags="-s -w" github.com/gokcehan/lf@latest
}

install_imgcat() {
  echo "::: Installing imgcat :::"
  pip install imgcat
}

install_nvm() {
  echo "::: Installing nvm :::"

  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  cd ~/.nvm && . ./nvm.sh && cd -
  nvm install node # "node" is an alias for the latest version
  nvm use node
}

install_yarn() {
  echo "::: Installing yarn :::"
  npm install --global yarn
}

install_trash() {
  echo "::: Installing trash :::"
  npm install --global trash-cli
}

config_tmux() {
  echo "::: Configuring tmux :::"
  if [ ! -d ~/.tmux/plugins/tpm ]
  then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  ~/.tmux/plugins/tpm/bin/install_plugins
}

install_zsh() {
  echo "::: Installing zsh :::"

  if [ -d $HOME/.oh-my-zsh ]
  then
    cd $HOME/.oh-my-zsh
    git pull
  else
    export RUNZSH=no
    export KEEP_ZSHRC=yes
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  fi

  [ ! -d ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  [ ! -d ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions ] &&  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
  [ ! -d ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  [ ! -d  ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
}

fix_zsh_permissions() {
  echo "::: Fix zsh permissions :::"

  chmod 755 /usr/local/share/zsh
  chmod 755 /usr/local/share/zsh/site-functions
}

install_linux() {
  sudo apt update
  sudo apt -y install \
    build-essential \
    git \
    git-lfs \
    git-crypt \
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
    curl \
    silversearcher-ag \
    autojump \
    libmagic-dev

  [ ! -x /usr/bin/bat ] && sudo ln -s /usr/bin/batcat /usr/bin/bat

  install_dotfiles

  install_pyenv
  install_fzf
  # install_pistol
  # install_if
  install_nvm
  install_trash
  install_yarn
  install_imgcat

  install_zsh

  config_tmux
}

install_macos() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  brew install coreutils git tmux zsh go asdf fzf autojump bat wget curl fd gpg git-crypt git-lfs git-secret libmagic awscli docker pipenv virtualenv libjpeg the_silver_searcher htop dua-cli git-delta eza diff-so-fancy  

  brew install rectangle || true
  brew install alt-tab || true

  install_dotfiles
  install_pyenv
  install_fzf
  # install_pistol
  install_if
  install_nvm
  install_trash
  install_yarn

  install_zsh
  fix_zsh_permissions

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
echo "Please don't forget to customize your $HOME/.gitconfig ..."
