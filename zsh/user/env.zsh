export EDITOR='vim'
export PIP_REQUIRE_VIRTUALENV=true
export GOPATH="${HOME}/Projects/golang"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=14"

if [[ -d "${HOME}/bin" ]]; then
	export PATH="${HOME}/bin:${PATH}"
fi
