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
alias code="open --new -a 'Visual Studio Code' --args \$PWD"
alias py="open --new -a 'PyCharm' --args \$PWD"

t() {
  tmux attach-session -t local || tmux new-session -s local
}

PROMPT='[%D{%K:%M:%S}] ${ret_status}%{$fg_bold[green]%}%p %{$fg[green]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}${NEWLINE}$ '

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -s $HOME/.nix-profile/etc/profile.d/nix.sh ] && source $HOME/.nix-profile/etc/profile.d/nix.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh
[ -f $HOME/.fzf.sh ] && source $HOME/.fzf.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

[ -f $HOME/.secret.sh ] && source $HOME/.secret.sh
[ -f $HOME/.config/lf/lfcd.sh ] && source $HOME/.config/lf/lfcd.sh
[ -f $HOME/.config/lf/env.sh ] && source $HOME/.config/lf/env.sh
[ -f $HOME/.local.zsh ] && source $HOME/.local.zsh
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash

export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[ -s "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"

# tabtab source for packages
# uninstall by removing these lines
[ -f $HOME/.config/tabtab/__tabtab.zsh ] && source $HOME/.config/tabtab/__tabtab.zsh || true
[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ] && source $HOME/.nix-profile/etc/profile.d/nix.sh

alias top='htop'
alias du='ncdu'
alias ccd='cd $HOME/git'
alias rm='trash' # npm i -g trash-cli
alias wiki='wikit' # npm i -g wikit
alias weat='curl http://wttr.in/'
alias icat="kitty +kitten icat"
alias dot="git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
