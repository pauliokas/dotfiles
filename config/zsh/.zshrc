# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZPLUG_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zplug"
export ZPLUG_LOADFILE="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zplug.zsh"
export ZPLUG_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zplug"
source "$(brew --prefix zplug)/init.zsh"

# enable iterm2 shell integration. has to be set before sourcing the plugin from oh-my-zsh
zstyle :omz:plugins:iterm2 shell-integration yes

if ! zplug check; then
    zplug install
fi
zplug load
