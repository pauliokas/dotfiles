#!/usr/bin/env zsh

source ~/.zsh/zsh-git-prompt/zshrc.sh

cd $1

update_current_git_vars

ZSH_THEME_GIT_PROMPT_RESET_COLOR="#[default]"
# Default values for the appearance of the prompt.
# The theme is identical to magicmonty/bash-git-prompt
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_HASH_PREFIX=":"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="#[fg=colour171,bold]"
ZSH_THEME_GIT_PROMPT_STAGED="#[fg=colour196]●"
ZSH_THEME_GIT_PROMPT_CONFLICTS="#[fg=colour196]✖"
ZSH_THEME_GIT_PROMPT_CHANGED="#[fg=colour27]✚"
ZSH_THEME_GIT_PROMPT_BEHIND="↓·"
ZSH_THEME_GIT_PROMPT_AHEAD="↑·"
ZSH_THEME_GIT_PROMPT_STASHED="#[fg=colour27]⚑"
ZSH_THEME_GIT_PROMPT_UNTRACKED="#[fg=colour45]…"
ZSH_THEME_GIT_PROMPT_CLEAN="#[fg=colour40]✔"
ZSH_THEME_GIT_PROMPT_LOCAL=" ⌂"
# The remote branch will be shown between these two
ZSH_THEME_GIT_PROMPT_UPSTREAM_FRONT=" #[fg=colour27]{"
ZSH_THEME_GIT_PROMPT_UPSTREAM_END="$ZSH_THEME_GIT_PROMPT_RESET_COLOR}"
ZSH_THEME_GIT_PROMPT_MERGING="#[fg=colour171]|MERGING$ZSH_THEME_GIT_PROMPT_RESET_COLOR"
ZSH_THEME_GIT_PROMPT_REBASE="#[fg=colour171]|REBASE$ZSH_THEME_GIT_PROMPT_RESET_COLOR "

git_super_status
