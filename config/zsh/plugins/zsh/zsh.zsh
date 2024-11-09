bindkey -e  # use emacs keymap

HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

setopt EXTENDED_GLOB

setopt BANG_HIST
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt NO_NOMATCH

setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
setopt HIST_BEEP

unsetopt FLOW_CONTROL

zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e)%f'

zstyle ':completion:*' group-name ''

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':autocomplete:*' groups 'always'

autoload -U select-word-style && select-word-style bash

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
