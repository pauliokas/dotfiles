autoload -Uz promptinit
promptinit

source "${HOME}/.zsh.d/zsh-git-prompt/zshrc.sh"

PROMPT=" %~ %# "
RPROMPT=$(git_super_status)
