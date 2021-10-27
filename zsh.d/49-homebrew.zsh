[ -f /opt/homebrew/bin/brew ] || return

eval $(/opt/homebrew/bin/brew shellenv)

export HOMEBREW_NO_AUTO_UPDATE="1"
export HOMEBREW_NO_INSTALL_CLEANUP="1"
