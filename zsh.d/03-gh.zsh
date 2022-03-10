command -v gh >/dev/null || return
gh completion --shell zsh > $HOME/.zsh.d/site-functions/_gh
