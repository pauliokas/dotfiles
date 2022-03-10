zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e)%f'

zstyle ':completion:*' group-name ''

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':autocomplete:*' groups 'always'
