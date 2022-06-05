# Start profiling zsh
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ -f "$HOME/.personal.zsh" ]]
then
  source "$HOME/.personal.zsh"
else
  source $ZSH/oh-my-zsh.sh
fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# if [ -e /Users/daniel.han/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/daniel.han/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
# zprof
# ZSH_THEME="simple"

# plugins+=(
#   zsh-autosuggestions
#   zsh-completions
# )

# fpath=(~/.zsh/completion $fpath)

# autoload -Uz compinit && compinit -i

# Comment out this line in $HOME/.zshrc
# source $ZSH/oh-my-zsh.sh

# PATH=/usr/local/sbin:$PATH

# if [ -d $HOME/bin ]
# then
#   PATH=$PATH:$HOME/bin
# fi

# if [ -d $HOME/go/bin ]
# then
#   PATH=$PATH:$HOME/go/bin
# fi

# if [ -d $HOME/.asdf ]
# then
#   . $HOME/.asdf/asdf.sh
#   . $HOME/.asdf/completions/asdf.bash
# fi

# unsetopt share_history
# alias e='emacs -nw'
# alias yi='yarn install'
# alias ys='yarn start'
# alias lg='lazygit'

# [ -d "/Applications/Code.app" ] && VSCODE_PATH="Code"
# [ -d "/Applications/VSCode.app" ] && VSCODE_PATH="VSCode"
# [ -d "/Applications/Visual Studio Code.app" ] && VSCODE_PATH="Visual Studio Code"
# [ -n "$VSCODE_PATH" ] && alias code="open --new -a '$VSCODE_PATH' --args \$PWD"

# [ -d "/Applications/PyCharm.app" ] && PYCHARM_PATH="PyCharm"
# [ -d "/Applications/PyCharm CE.app" ] && PYCHARM_PATH="PyCharm CE"
# [ -n "$PYCHARM_PATH" ] && alias py="open --new -a '$PYCHARM_PATH' --args \$PWD"

# alias dot="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# t() {
#   tmux attach-session -t local || tmux new-session -s local
# }

# cd() {
#    if [ "$1" = "-" ]; then
#      builtin cd -
#    elif [ "$1" != "" ]; then
#      builtin cd "$(realpath $1)"
#    else
#      builtin cd
#    fi
# }

# PROMPT='[%D{%K:%M:%S}]${ret_status}%{$fg_bold[green]%}%p %{$fg[green]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}${NEWLINE}$ '

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# [ -s $HOME/.nix-profile/etc/profile.d/nix.sh ] && source $HOME/.nix-profile/etc/profile.d/nix.sh
# [ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh
# [ -f $HOME/.fzf.sh ] && source $HOME/.fzf.sh
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# [ -f $HOME/.config/lf/lfcd.sh ] && source $HOME/.config/lf/lfcd.sh
# [ -f $HOME/.config/lf/env.sh ] && source $HOME/.config/lf/env.sh
# [ -f $HOME/.local.sh ] && source $HOME/.local.sh
# [ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
# [ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash

# export SDKMAN_DIR="$HOME/.sdkman"
# [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# tabtab source for packages
# uninstall by removing these lines
# [ -f $HOME/.config/tabtab/__tabtab.zsh ] && source $HOME/.config/tabtab/__tabtab.zsh || true

# alias top='htop'
# alias du='ncdu'
# alias ccd='cd $HOME/git'
# alias rm='trash' # npm i -g trash-cli
# alias wiki='wikit' # npm i -g wikit
# alias weat='curl http://wttr.in/'
# alias icat="kitty +kitten icat"
# alias dot="git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"
# alias zip-with-password='zip -er'

# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# export PATH=$PYENV_ROOT/versions/$(python -c 'import platform; print(platform.python_version())')/bin:$PATH

# alias ecr-login-qa="aws ecr get-login-password --profile scrive_ecr --region eu-west-1 | docker login --username AWS --password-stdin 609534010517.dkr.ecr.eu-west-1.amazonaws.com"
# alias ecr-login-prod="aws --profile 720173602891_ECReadOnly ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 720173602891.dkr.ecr.eu-west-1.amazonaws.com"
# alias ecr-login-qa="aws --profile 609534010517_AdministratorAccess ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 609534010517.dkr.ecr.eu-west-1.amazonaws.com"

# End of profiling zsh
# zprof
