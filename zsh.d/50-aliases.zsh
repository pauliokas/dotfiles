command -v prettyping >/dev/null && alias ping="prettyping --nolegend"
command -v htop >/dev/null && alias top=htop
command -v bat >/dev/null && alias cat=bat

case "$OSTYPE" in
    darwin*)
        alias ls="ls -G"
        ;;
    linux*)
        alias ls="ls --color=auto"
        ;;
esac
