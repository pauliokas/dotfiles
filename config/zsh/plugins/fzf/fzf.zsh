command -v fzf >/dev/null || return 0

source <(fzf --zsh)
