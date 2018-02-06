autoload -Uz compinit
setopt extendedglob

zstyle ':completion:*' menu select

fpath=(
  ~/.zsh/zsh-sensible
  ~/.zsh/zsh-git-prompt
  ~/.zsh/oh-my-zsh/plugins/gradle
  ~/.zsh/oh-my-zsh/plugins/docker
  ~/.zsh/oh-my-zsh/plugins/docker-compose
  ~/.zsh/zsh-syntax-highlighting
  ~/.zsh/user
  ${fpath}
)

compinit

source ~/.zsh/zsh-sensible/sensible.plugin.zsh
source ~/.zsh/zsh-git-prompt/zshrc.sh
source ~/.zsh/oh-my-zsh/plugins/gradle/gradle.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/docker-compose/docker-compose.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh/user/env.zsh
source ~/.zsh/user/aliases.zsh
source ~/.zsh/user/prompt.zsh
source ~/.zsh/user/rprompt.zsh
source ~/.zsh/user/functions.zsh
source ~/.zsh/user/nvm.zsh
source ~/.zsh/user/tab-title.zsh

source ~/.fzf.zsh
source ~/.iterm2_shell_integration.zsh

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
