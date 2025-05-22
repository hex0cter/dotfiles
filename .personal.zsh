[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
[[ -d $HOME/.local/bin ]] && PATH=$PATH:$HOME/.local/bin
[[ -d $HOME/.cargo/bin ]] && PATH=$PATH:$HOME/.cargo/bin
[[ -d $HOME/go/bin ]] && PATH=$PATH:$HOME/go/bin
[[ -d $HOME/.local/share/rye/bin ]] && PATH=$PATH:$HOME/.local/share/rye/bin


[ -d "/Applications/Code.app" ] && VSCODE_PATH="Code"
[ -d "/Applications/Visual Studio Code.app" ] && VSCODE_PATH="Visual Studio Code"
[ -n "$VSCODE_PATH" ] && alias co="open --new -a '$VSCODE_PATH' --args \$PWD"

[ -d "/Applications/PyCharm.app" ] && PYCHARM_PATH="PyCharm"
[ -d "/Applications/PyCharm CE.app" ] && PYCHARM_PATH="PyCharm CE"
[ -n "$PYCHARM_PATH" ] && alias py="open --new -a '$PYCHARM_PATH' --args \$PWD"

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

# PROMPT='[%D{%K:%M:%S}]${ret_status}%{$fg_bold[green]%}%p %{$fg[green]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}${NEWLINE}$ '
# PROMPT='[$(hostname)] [%D{%K:%M:%S}]${ret_status}%{$fg_bold[green]%} %2d%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}${NEWLINE}$ '

nvm_init() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

pyenv_init() {
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
}

# which pyenv >/dev/null && pyenv_init

[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.config/lf/lfcd.sh ] && source $HOME/.config/lf/lfcd.sh
[ -f $HOME/.config/lf/env.sh ] && source $HOME/.config/lf/env.sh
[ -f $HOME/.rye/env ] && source "$HOME/.rye/env"

[[ -z $(which htop) ]] && alias top='htop'
[[ -z $(which du) ]] && alias du='dua i'
[[ -z $(which trash) ]] && alias rm='trash' # npm i -g trash-cli
[[ -z $(which wikit) ]] && alias wiki='wikit' # npm i -g wikit
[[ -z $(which kitty) ]] && alias icat="kitty +kitten icat"
[[ -z $(which eza) ]] && alias ls='eza --icons --git-ignore'
[[ -z $(which emacs) ]] && alias e='emacs -nw'
[[ -z $(which lazygit) ]] && alias lg='lazygit'

alias dot="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias download-links-from-url="wget -r -np -nc -l 0 -A"
alias ag='ag --hidden'
alias weather='curl http://wttr.in/'
alias ccd='cd $HOME/git'
alias dot="git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"
alias zip-with-password='zip -er'

export ANDROID_HOME=$HOME/Library/Android/sdk
[[ -d $ANDROID_HOME/platform-tools ]] && PATH=$PATH:$ANDROID_HOME/platform-tools
[[ -d $ANDROID_HOME/emulator ]] && PATH=$PATH:$ANDROID_HOME/emulator

export GEM_HOME=$HOME/.gem
[[ -d $GEM_HOME/bin ]] && PATH=$GEM_HOME/bin:$PATH

export PNPM_HOME="$HOME/Library/pnpm"
[[ -d $PNPM_HOME ]] && PATH="$PNPM_HOME:$PATH"

[ -f $HOME/.local.sh ] && source $HOME/.local.sh

fpath=(~/.zsh/completion $fpath)

export PATH
