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

# Use fzf for fuzzy history search
h() {
  local cmd=$(history -n | tail -r | fzf)
  echo $cmd
  print -s "$cmd"
  eval $cmd
}


# Use fzf for file discovery, requires fd
export FZF_DEFAULT_OPTS='--height 90% --exact --layout=reverse --border --cycle'
[ ! "$(which fd)" ] && alias fd=fdfind
export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude "*.pyc" --exclude node_modules' # add --hidden to include hidden files

# alias f="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null'"
alias f="fzf --preview '([[ -f {} ]] && (pistol {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} '"
