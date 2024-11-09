command -v nvim >/dev/null || return 0

export EDITOR="nvim"
alias vimdiff='nvim -d'
