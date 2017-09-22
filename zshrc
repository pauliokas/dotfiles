autoload -Uz compinit
compinit
setopt extendedglob

zstyle ':completion:*' menu select

source "${HOME}/.zsh/zgen/zgen.zsh"
PLUGINS="${HOME}/.zsh"
if ! zgen saved; then
	zgen load ${PLUGINS}/zsh-sensible

	zgen load ${PLUGINS}/zsh-git-prompt
	zgen load ${PLUGINS}/oh-my-zsh/plugins/gradle
	zgen load ${PLUGINS}/oh-my-zsh/plugins/docker/_docker
	zgen load ${PLUGINS}/oh-my-zsh/plugins/docker-compose
	zgen load ${PLUGINS}/zsh-syntax-highlighting

	zgen load ${PLUGINS}/user/env.zsh
	zgen load ${PLUGINS}/user/aliases.zsh
	zgen load ${PLUGINS}/user/prompt.zsh
	zgen load ${PLUGINS}/user/rprompt.zsh
	zgen load ${PLUGINS}/user/functions.zsh

	mkdir -p "${HOME}/.zgen"
	zgen save

	rm -f "${HOME}/.zcompdump"; compinit
fi

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ${HOME}/.iterm2_shell_integration.zsh ] && source "${HOME}/.iterm2_shell_integration.zsh"

