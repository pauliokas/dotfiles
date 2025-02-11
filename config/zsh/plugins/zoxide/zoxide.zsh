command -v zoxide >/dev/null || return 0

source <(_ZO_DATA_DIR="${XDG_DATA_DIR:-$HOME/.local/share}" zoxide init zsh)

alias cd=z
