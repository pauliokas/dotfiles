autoload -Uz promptinit
promptinit

export ZSH_THEME_GIT_PROMPT_CACHE=1
source "${HOME}/.zsh.d/zsh-git-prompt/zshrc.sh"

PROMPT=" %~ %# "
RPROMPT=$(git_super_status)
