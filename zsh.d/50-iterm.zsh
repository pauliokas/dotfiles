utils_path="$HOME/.zsh.d/iterm2-website/source/utilities"

[ ! "$utils_path/it2check" >/dev/null ] && return

source "${HOME}/.zsh.d/iterm2-website/source/shell_integration/zsh"

# https://www.iterm2.com/documentation-badges.html
function it2badge() {
  local readonly badge_str="$@"
  printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n $badge_str | base64)
}

