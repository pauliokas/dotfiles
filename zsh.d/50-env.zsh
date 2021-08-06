export EDITOR='vim'

if [[ -d "${HOME}/.local/bin" ]]; then
	export PATH="${HOME}/.local/bin:${PATH}"
fi

if [[ -d "${HOME}/.config/emacs/bin" ]]; then
	export PATH="${HOME}/.config/emacs/bin:${PATH}"
fi
