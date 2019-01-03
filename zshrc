source ~/.zsh/zsh-sensible/sensible.plugin.zsh

setopt EXTENDEDGLOB

fpath=(
  ~/.zsh/zsh-sensible
  ~/.zsh/zsh-git-prompt
  ~/.zsh/oh-my-zsh/plugins/gradle
  ~/.zsh/oh-my-zsh/plugins/docker
  ~/.zsh/oh-my-zsh/plugins/docker-compose
  ~/.zsh/oh-my-zsh/plugins/nvm
  ~/.zsh/zsh-syntax-highlighting
  ~/.zsh/user
  ${fpath}
)

compinit

source ~/.zsh/zsh-git-prompt/zshrc.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/oh-my-zsh/plugins/gradle/gradle.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/docker-compose/docker-compose.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/yarn/yarn.plugin.zsh
source ~/.zsh/user/env.zsh
source ~/.zsh/user/aliases.zsh
source ~/.zsh/user/prompt.zsh
source ~/.zsh/user/rprompt.zsh
source ~/.zsh/user/functions.zsh
source ~/.zsh/user/tab-title.zsh
source ~/.zsh/user/nvm.zsh
source ~/.zsh/user/fasd.zsh
source ~/.zsh/user/fzf.zsh

source ~/.fzf.zsh
source ~/.iterm2_shell_integration.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
