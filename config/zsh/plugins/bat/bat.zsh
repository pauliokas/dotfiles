command -v bat >/dev/null || return 0

export MANPAGER="sh -c 'col -bx | bat --language=man --plain'"
export MANROFFOPT="-c"

alias 'cat=bat'
