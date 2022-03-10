command -v pyenv >/dev/null || return

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
