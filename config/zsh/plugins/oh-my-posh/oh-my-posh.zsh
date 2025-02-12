command -v oh-my-posh >/dev/null || return 0

eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-posh/theme.omp.yaml)"
