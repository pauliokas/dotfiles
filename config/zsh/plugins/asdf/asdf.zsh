command -v fzf >/dev/null || return 0

# export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/asdf-vm/.asdfrc"
# export ASDF_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/asdf-vm/.asdfrc"

export ASDF_DIR="$(brew --prefix asdf)/libexec"
export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/asdf-vm/.asdfrc"
export ASDF_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/asdf-vm"
source "$(brew --prefix asdf)/libexec/asdf.sh"
