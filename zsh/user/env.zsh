export EDITOR='vim'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=14"

if [[ -d "${HOME}/bin" ]]; then
	export PATH="${HOME}/bin:${PATH}"
fi
