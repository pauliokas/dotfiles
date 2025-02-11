zstyle ":zplug:tag" defer 1

zplug_plugins="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins"

zplug "$zplug_plugins/oh-my-posh", from:local

zplug "zsh-users/zsh-autosuggestions", depth:1
zplug "zsh-users/zsh-syntax-highlighting", depth:1, defer:3

zplug "plugins/command-not-found", from:oh-my-zsh, depth:1
zplug "plugins/docker-compose", from:oh-my-zsh, depth:1
zplug "plugins/iterm2", from:oh-my-zsh, depth:1
zplug "plugins/terraform", from:oh-my-zsh, depth:1
zplug "plugins/yarn", from:oh-my-zsh, depth:1

zplug "$zplug_plugins/asdf", from:local
zplug "$zplug_plugins/bat", from:local
zplug "$zplug_plugins/btop", from:local
zplug "$zplug_plugins/carvertical", from:local
zplug "$zplug_plugins/direnv", from:local
zplug "$zplug_plugins/fzf", from:local
zplug "$zplug_plugins/jq", from:local
zplug "$zplug_plugins/lsd", from:local
zplug "$zplug_plugins/nvim", from:local
zplug "$zplug_plugins/python", from:local
zplug "$zplug_plugins/serverless", from:local
zplug "$zplug_plugins/zoxide", from:local
zplug "$zplug_plugins/zsh", from:local
