fpath=(
  $HOME/.zsh.d/oh-my-zsh/plugins/docker
  $HOME/.zsh.d/oh-my-zsh/plugins/docker-compose
  $HOME/.zsh.d/oh-my-zsh/plugins/nvm
  ${fpath}
)

autoload -Uz compinit
compinit
