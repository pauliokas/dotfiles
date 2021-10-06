command -v pyenv >/dev/null || return

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
