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
source ~/.zsh/user/tab-title.zsh
source ~/.zsh/user/nvm.zsh
source ~/.zsh/user/fasd.zsh
source ~/.zsh/user/fzf.zsh

source ~/.fzf.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

