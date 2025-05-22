# Start profiling zsh
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

export ZSH="$HOME/.oh-my-zsh"

if [[ -f "$HOME/.personal.zsh" ]]
then
  source "$HOME/.personal.zsh"
else
  source $ZSH/oh-my-zsh.sh
fi

# End of profiling zsh
# zprof
