fpath=(
  $HOME/.zsh.d/oh-my-zsh/plugins/docker
  $HOME/.zsh.d/oh-my-zsh/plugins/docker-compose
  $HOME/.zsh.d/oh-my-zsh/plugins/nvm
  $HOME/.zsh.d/oh-my-zsh/plugins/yarn
  $HOME/.zsh.d/site-functions
  /opt/homebrew/share/zsh/site-functions
  ${fpath}
)

autoload -Uz compinit
compinit
