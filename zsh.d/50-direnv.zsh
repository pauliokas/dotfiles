(( ${+commands[direnv]} )) || return

export DIRENV_LOG_FORMAT=
eval "$(direnv hook zsh)"
