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
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -s $HOME/.nix-profile/etc/profile.d/nix.sh ] && . $HOME/.nix-profile/etc/profile.d/nix.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f $HOME/.fzf.sh ] && . $HOME/.fzf.sh
[ -f $HOME/.secret.sh ] && . $HOME/.secret.sh
[ -f $HOME/.config/lf/lfcd.sh ] && . $HOME/.config/lf/lfcd.sh
[ -f $HOME/.config/lf/env.sh ] && . $HOME/.config/lf/env.sh

alias aws-ec2="ssh ubuntu@34.244.172.202"
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
