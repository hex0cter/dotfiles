ZSH_THEME="powerlevel10k/powerlevel10k"

plugins+=(
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  web-search
)

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i

# Comment out this line in $HOME/.zshrc
source $ZSH/oh-my-zsh.sh

PATH=/usr/local/sbin:$HOME/.cargo/bin:$PATH

if [ -d $HOME/bin ]
then
  PATH=$PATH:$HOME/bin
fi

if [ -d $HOME/go/bin ]
then
  PATH=$PATH:$HOME/go/bin
fi

[ -d "/Applications/Code.app" ] && VSCODE_PATH="Code"
[ -d "/Applications/VSCode.app" ] && VSCODE_PATH="VSCode"
[ -d "/Applications/Visual Studio Code.app" ] && VSCODE_PATH="Visual Studio Code"
[ -n "$VSCODE_PATH" ] && alias code="open --new -a '$VSCODE_PATH' --args \$PWD"
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
PROMPT='[$(hostname)] [%D{%K:%M:%S}]${ret_status}%{$fg_bold[green]%} %2d%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}${NEWLINE}$ '

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

[ -n "$VSCODE_SHELL_INTEGRATION" ] && nvm_init
which pyenv > /dev/null && pyenv_init

[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.config/lf/lfcd.sh ] && source $HOME/.config/lf/lfcd.sh
[ -f $HOME/.config/lf/env.sh ] && source $HOME/.config/lf/env.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# [ -f $HOME/.rye/env ] && source "$HOME/.rye/env"

export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# tabtab source for packages
# uninstall by removing these lines
[ -f $HOME/.config/tabtab/__tabtab.zsh ] && source $HOME/.config/tabtab/__tabtab.zsh || true

# [ -f /usr/local/opt/asdf/libexec/asdf.sh ] && source /usr/local/opt/asdf/libexec/asdf.sh

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
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
   *":$PNPM_HOME:"*) ;;
   *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
unsetopt share_history

[ -f $HOME/.local.sh ] && source $HOME/.local.sh
