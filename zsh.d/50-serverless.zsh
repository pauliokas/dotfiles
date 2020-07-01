command -v serverless >/dev/null || return

[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
export AWS_SDK_LOAD_CONFIG=1
