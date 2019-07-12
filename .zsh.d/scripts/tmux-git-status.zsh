#!/usr/bin/env zsh

source ~/.zsh.d/zsh-git-prompt/zshrc.sh

cd $1

update_current_git_vars

ZSH_THEME_GIT_PROMPT_RESET_COLOR="#[default]"
# Default values for the appearance of the prompt.
# The theme is identical to magicmonty/bash-git-prompt
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_HASH_PREFIX=":"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="#[fg=brightmagenta,bold]"
ZSH_THEME_GIT_PROMPT_STAGED="#[fg=brightred]●"
ZSH_THEME_GIT_PROMPT_CONFLICTS="#[fg=brightred]✖"
ZSH_THEME_GIT_PROMPT_CHANGED="#[fg=brightblue]✚"
ZSH_THEME_GIT_PROMPT_BEHIND="↓·"
ZSH_THEME_GIT_PROMPT_AHEAD="↑·"
ZSH_THEME_GIT_PROMPT_STASHED="#[fg=brightblue]⚑"
ZSH_THEME_GIT_PROMPT_UNTRACKED="#[fg=brightcyan]…"
ZSH_THEME_GIT_PROMPT_CLEAN="#[fg=brightgreen]✔"
ZSH_THEME_GIT_PROMPT_LOCAL=" ⌂"
# The remote branch will be shown between these two
ZSH_THEME_GIT_PROMPT_UPSTREAM_FRONT=" #[fg=brightblue]{"
ZSH_THEME_GIT_PROMPT_UPSTREAM_END="$ZSH_THEME_GIT_PROMPT_RESET_COLOR}"
ZSH_THEME_GIT_PROMPT_MERGING="#[fg=brightmagenta]|MERGING$ZSH_THEME_GIT_PROMPT_RESET_COLOR"
ZSH_THEME_GIT_PROMPT_REBASE="#[fg=brightmagenta]|REBASE$ZSH_THEME_GIT_PROMPT_RESET_COLOR "

git_super_status
