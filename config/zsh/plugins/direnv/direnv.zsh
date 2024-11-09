command -v direnv >/dev/null || return 0

export DIRENV_LOG_FORMAT=""
eval "$(direnv hook zsh)"
