# Start profiling zsh
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_UPDATE="true"

ZSH_THEME="geoffgarside"

plugins+=(
  git
  docker
  docker-compose
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  web-search
)

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=100000

setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
unsetopt share_history

if [[ -f "$HOME/.personal.zsh"  && "$TERM_PROGRAM" != "vscode" ]]
then
  source "$HOME/.personal.zsh"
else
  source $ZSH/oh-my-zsh.sh
fi

autoload -Uz compinit && compinit -i

source $ZSH/oh-my-zsh.sh

# End of profiling zsh
# zprof
