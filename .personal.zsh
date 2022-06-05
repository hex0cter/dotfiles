ZSH_THEME="simple"

plugins+=(
  zsh-autosuggestions
  zsh-completions
)

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i

# Comment out this line in $HOME/.zshrc
source $ZSH/oh-my-zsh.sh

PATH=/usr/local/sbin:$PATH

if [ -d $HOME/bin ]
then
  PATH=$PATH:$HOME/bin
fi

if [ -d $HOME/go/bin ]
then
  PATH=$PATH:$HOME/go/bin
fi

if [ -d $HOME/.asdf ]
then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

unsetopt share_history
alias e='emacs -nw'
alias yi='yarn install'
alias ys='yarn start'
alias lg='lazygit'

[ -d "/Applications/Code.app" ] && VSCODE_PATH="Code"
[ -d "/Applications/VSCode.app" ] && VSCODE_PATH="VSCode"
[ -d "/Applications/Visual Studio Code.app" ] && VSCODE_PATH="Visual Studio Code"
[ -n "$VSCODE_PATH" ] && alias code="open --new -a '$VSCODE_PATH' --args \$PWD"

[ -d "/Applications/PyCharm.app" ] && PYCHARM_PATH="PyCharm"
[ -d "/Applications/PyCharm CE.app" ] && PYCHARM_PATH="PyCharm CE"
[ -n "$PYCHARM_PATH" ] && alias py="open --new -a '$PYCHARM_PATH' --args \$PWD"

alias dot="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias download-mp3-from-url="wget -r -np -nc -l 1 -A mp3"

t() {
  tmux attach-session -t local || tmux new-session -s local
}

cd() {
   if [ "$1" = "-" ]; then
     builtin cd -
   elif [ "$1" != "" ]; then
     builtin cd "$(realpath $1)"
   else
     builtin cd
   fi
}

PROMPT='[%D{%K:%M:%S}]${ret_status}%{$fg_bold[green]%}%p %{$fg[green]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}${NEWLINE}$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh
[ -f $HOME/.fzf.sh ] && source $HOME/.fzf.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

[ -f $HOME/.config/lf/lfcd.sh ] && source $HOME/.config/lf/lfcd.sh
[ -f $HOME/.config/lf/env.sh ] && source $HOME/.config/lf/env.sh
[ -f $HOME/.local.sh ] && source $HOME/.local.sh
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash

export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# tabtab source for packages
# uninstall by removing these lines
[ -f $HOME/.config/tabtab/__tabtab.zsh ] && source $HOME/.config/tabtab/__tabtab.zsh || true

alias top='htop'
alias du='ncdu'
alias ccd='cd $HOME/git'
alias rm='trash' # npm i -g trash-cli
alias wiki='wikit' # npm i -g wikit
alias weat='curl http://wttr.in/'
alias icat="kitty +kitten icat"
alias dot="git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"
alias zip-with-password='zip -er'

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export PATH=$PYENV_ROOT/versions/$(python -c 'import platform; print(platform.python_version())')/bin:$PATH
