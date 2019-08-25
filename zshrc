if [[ -d "$HOME/.zsh.d" ]]; then
  for f in $HOME/.zsh.d/*.zsh ; do
    source "$f"
  done
  unset f
fi
