export EDITOR='vim'
export PIP_REQUIRE_VIRTUALENV=true
export GOPATH="${HOME}/Projects/golang"

if [[ -d "${HOME}/bin" ]]; then
	export PATH="${HOME}/bin:${PATH}"
fi

