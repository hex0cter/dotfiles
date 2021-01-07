# Use * as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER="*"

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

c() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}

# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]lugin
brew-get() {
  local inst=$(brew search $1 | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]lugin
brew-update() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]lugin (e.g. uninstall)
brew-delete() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}

# Use fzf for fuzzy history search
h() {
  local cmd=$(history -n | tail -r | fzf)
  echo $cmd
  print -s "$cmd"
  eval $cmd
}


# Use fzf for file discovery, requires fd
export FZF_DEFAULT_OPTS='--height 90% --exact --layout=reverse --border --cycle'
export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude "*.pyc" --exclude node_modules' # add --hidden to include hidden files

# alias f="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null'"
alias f="fzf --preview '([[ -f {} ]] && (pistol {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} '"
